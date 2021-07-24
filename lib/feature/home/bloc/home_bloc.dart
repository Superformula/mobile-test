import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qrtestcodeone/domain/entity/qr_seed.dart';
import 'package:qrtestcodeone/domain/usecase/get_qrcode_seed_usecase.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetQrCodeSeedUseCase getQrCodeSeedUseCase;

  HomeBloc(this.getQrCodeSeedUseCase) : super(HomeState.initial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield* event.when(
      generateQrCode: () async* {
        try {
          yield HomeState.onLoading();
          final QrSeed qrSeed = await getQrCodeSeedUseCase();
          yield HomeState.onQrSeedReady(qrSeed);
        } on Exception catch (_) {
          yield HomeState.onErrorGeneratingQrCode();
        }
      },
      scanQrCode: () async* {
        yield HomeState.onQrScanRequested();
      },
      handleScannedQrCode: (String qrCode) async* {
        yield HomeState.onQrCodeScanned(qrCode);
      },
    );
  }
}

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.generateQrCode() = _generateQrCode;
  const factory HomeEvent.scanQrCode() = _scanQrCode;
  const factory HomeEvent.handleScannedQrCode(String qrCode) =
      _handleScannedQrCode;
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.onLoading() = _Loading;
  const factory HomeState.onQrSeedReady(QrSeed qrSeed) = _OnQrSeedReady;
  const factory HomeState.onQrScanRequested() = _OnQrScanRequested;
  const factory HomeState.onQrCodeScanned(String qrCode) = _OnQrCodeScanned;
  const factory HomeState.onErrorGeneratingQrCode() = _OnErrorGenerationQrCode;
}
