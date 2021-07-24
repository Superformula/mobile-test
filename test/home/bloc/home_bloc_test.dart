import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qrtestcodeone/domain/entity/qr_seed.dart';
import 'package:qrtestcodeone/domain/usecase/get_qrcode_seed_usecase.dart';
import 'package:qrtestcodeone/feature/home/bloc/home_bloc.dart';
import 'package:test/test.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///
class MockGetQrCodeSeedUseCase extends Mock implements GetQrCodeSeedUseCase {}

void main() {
  late HomeBloc bloc;
  late GetQrCodeSeedUseCase useCase;
  final QrSeed qrSeed = QrSeed(seed: 'x', expiresAt: DateTime.now());
  final String scannedQrCode = 'fakeQrCode';

  setUp(() {
    useCase = MockGetQrCodeSeedUseCase();
    bloc = HomeBloc(useCase);
  });

  test('initialState should be "initial"', () {
    // assert
    expect(bloc.state, equals(HomeState.initial()));
  });

  blocTest(
    'should return qr-seed when getSeed is requested',
    build: () {
      when(() => useCase.call()).thenAnswer((_) async => qrSeed);
      return bloc;
    },
    act: (HomeBloc bloc) => bloc.add(HomeEvent.generateQrCode()),
    expect: () => [
      HomeState.onLoading(),
      HomeState.onQrSeedReady(qrSeed),
    ],
  );

  blocTest(
    'should return QR Scan Requested when trigger scan qr-code',
    build: () => bloc,
    act: (HomeBloc bloc) => bloc.add(HomeEvent.scanQrCode()),
    expect: () => [
      HomeState.onQrScanRequested(),
    ],
  );

  blocTest(
    'should return On QR Code Scanned when trigger handleScannedQrCode',
    build: () => bloc,
    act: (HomeBloc bloc) =>
        bloc.add(HomeEvent.handleScannedQrCode(scannedQrCode)),
    expect: () => [
      HomeState.onQrCodeScanned(scannedQrCode),
    ],
  );

  blocTest(
    'should throw an error when Generate QR Code fails',
    build: () {
      when(() => useCase.call()).thenThrow(Exception());
      return bloc;
    },
    act: (HomeBloc bloc) => bloc.add(HomeEvent.generateQrCode()),
    expect: () => [
      HomeState.onLoading(),
      HomeState.onErrorGeneratingQrCode(),
    ],
  );
}
