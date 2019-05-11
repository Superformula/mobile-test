import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:supercode/containers/code_scan_container.dart';
import 'package:supercode/containers/qr_code_container.dart';
import 'package:supercode/redux/actions.dart';
import 'package:supercode/redux/app_state.dart';
import 'package:supercode/redux/helpers.dart';
import 'package:supercode/services/seed_service.dart';

List<Middleware<AppState>> createMiddleware({
  @required GlobalKey<NavigatorState> navigatorKey,
  @required SeedService service,
}) {
  return [
    NavigateToQRCodeMiddleware(navigatorKey: navigatorKey),
    NavigateToScanMiddleware(navigatorKey: navigatorKey),
    FetchQRSeedMiddleware(seedService: service),
    ValidateCodeMiddleware(seedService: service),
  ];
}

class NavigateToQRCodeMiddleware
    extends TypedMiddlewareClass<AppState, NavigateToQRCode> {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigateToQRCodeMiddleware({@required this.navigatorKey});

  @override
  FutureOr<void> handler(
    Store<AppState> store,
    NavigateToQRCode action,
    NextDispatcher next,
  ) async {
    next(action);
    navigatorKey.currentState.push(
      MaterialPageRoute(
        builder: (context) => QRCodeContainer(),
        fullscreenDialog: true,
      ),
    );
  }
}

class NavigateToScanMiddleware
    extends TypedMiddlewareClass<AppState, NavigateToScan> {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigateToScanMiddleware({@required this.navigatorKey});

  @override
  FutureOr<void> handler(
    Store<AppState> store,
    NavigateToScan action,
    NextDispatcher next,
  ) async {
    next(action);
    navigatorKey.currentState.push(
      MaterialPageRoute(
        builder: (context) => CodeScanContainer(),
        fullscreenDialog: true,
      ),
    );
  }
}

class FetchQRSeedMiddleware
    extends TypedMiddlewareClass<AppState, FetchQRCode> {
  final SeedServiceImpl seedService;

  FetchQRSeedMiddleware({@required this.seedService});

  @override
  FutureOr<void> handler(
    Store<AppState> store,
    FetchQRCode action,
    NextDispatcher next,
  ) async {
    next(action);

    try {
      final seed = await seedService.fetchSeed();
      store.dispatch(FetchQRCodeSuccess(seed));
    } catch (e) {
      // TODO handle error
    }
  }
}

class ValidateCodeMiddleware
    extends TypedMiddlewareClass<AppState, ValidateCode> {
  final SeedService seedService;

  ValidateCodeMiddleware({@required this.seedService});

  @override
  FutureOr<void> handler(
    Store<AppState> store,
    ValidateCode action,
    NextDispatcher next,
  ) async {
    next(action);

    try {
      final isValid = await seedService.validateCode(action.code);
      store.dispatch(ValidateCodeSuccess(isValid));
    } catch (e) {
      // TODO handle error
    }
  }
}
