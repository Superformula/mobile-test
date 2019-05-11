import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:supercode/containers/code_scan_container.dart';
import 'package:supercode/containers/qr_code_container.dart';
import 'package:supercode/models.dart';
import 'package:supercode/redux/actions.dart';
import 'package:supercode/redux/app_state.dart';
import 'package:supercode/redux/middleware.dart';
import 'package:supercode/services/seed_service.dart';

// ignore: must_be_immutable
class MockGlobalKey extends Mock implements GlobalKey<NavigatorState> {}

class MockNavigatorState extends Mock implements NavigatorState {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return '';
  }
}

class MockSeedService extends Mock implements SeedService {}

class MockStore extends Mock implements Store<AppState> {}

void main() {
  group('Middleware', () {
    MockGlobalKey mockNavigatorKey;
    MockNavigatorState mockNavigatorState;
    MockSeedService mockSeedService;
    MockStore mockStore;

    setUp(() {
      mockNavigatorKey = MockGlobalKey();
      mockSeedService = MockSeedService();
      mockNavigatorState = MockNavigatorState();
      mockStore = MockStore();

      when(mockNavigatorKey.currentState).thenReturn(mockNavigatorState);
    });
    test('createMiddleware', () {
      final middleware = createMiddleware(
        navigatorKey: mockNavigatorKey,
        service: mockSeedService,
      );

      expect(middleware.length, equals(4));
    });
    group('NavigateToQRCodeMiddleware', () {
      NavigateToQRCodeMiddleware middleware;

      setUp(() {
        middleware = NavigateToQRCodeMiddleware(
          navigatorKey: mockNavigatorKey,
        );
      });
      test('should only handle NavigateToQRCode actions', () {
        expect(middleware.handlesAction(NavigateToQRCode()), isTrue);
      });
      test('should navigate to the QRCodeContainer', () async {
        await middleware.handler(mockStore, NavigateToQRCode(), (_) {});
        final route = verify(mockNavigatorState.push(captureAny)).captured.first
            as MaterialPageRoute;

        expect(route.builder(null), isInstanceOf<QRCodeContainer>());
        expect(route.fullscreenDialog, isTrue);
      });
    });
    group('NavigateToScanMiddleware', () {
      NavigateToScanMiddleware middleware;

      setUp(() {
        middleware = NavigateToScanMiddleware(
          navigatorKey: mockNavigatorKey,
        );
      });
      test('should only handle NavigateToScan actions', () {
        expect(middleware.handlesAction(NavigateToScan()), isTrue);
      });
      test('should navigate to the CodeScanContainer', () async {
        await middleware.handler(mockStore, NavigateToScan(), (_) {});
        final route = verify(mockNavigatorState.push(captureAny)).captured.first
            as MaterialPageRoute;

        expect(route.builder(null), isInstanceOf<CodeScanContainer>());
        expect(route.fullscreenDialog, isTrue);
      });
    });
    group('FetchQRSeedMiddleware', () {
      FetchQRSeedMiddleware middleware;

      setUp(() {
        middleware = FetchQRSeedMiddleware(seedService: mockSeedService);
      });
      test('should only handle FetchQRCode actions', () {
        expect(middleware.handlesAction(FetchQRCode()), isTrue);
      });
      test('should fetch the qr code - success', () async {
        when(mockSeedService.fetchSeed())
            .thenAnswer((_) => Future.value(Seed('abc123', DateTime(2020))));
        await middleware.handler(mockStore, FetchQRCode(), (_) {});
        verify(mockStore.dispatch(isInstanceOf<FetchQRCodeSuccess>()));
      });
    });
    group('ValidateCodeMiddleware', () {
      ValidateCodeMiddleware middleware;

      setUp(() {
        middleware = ValidateCodeMiddleware(seedService: mockSeedService);
      });
      test('should only handle ValidateCode actions', () {
        expect(middleware.handlesAction(ValidateCode('foobar')), isTrue);
      });
      test('should validate the qr code - success', () async {
        final code = '123def';
        when(mockSeedService.validateCode(code))
            .thenAnswer((_) => Future.value(true));
        await middleware.handler(mockStore, ValidateCode(code), (_) {});
        verify(mockStore.dispatch(ValidateCodeSuccess(true)));
      });
    });
  });
}
