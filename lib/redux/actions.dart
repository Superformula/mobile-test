import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code/model/seed.dart';

part 'actions.freezed.dart';

@freezed
abstract class FetchSeedAction with _$FetchSeedAction {
  const factory FetchSeedAction() = _FetchSeedAction;
}

@freezed
abstract class SeedLoadedAction with _$SeedLoadedAction {
  const factory SeedLoadedAction(Seed seed) = _SeedLoadedAction;
}

@freezed
abstract class FetchSeedFailedAction with _$FetchSeedFailedAction {
  const factory FetchSeedFailedAction() = _FetchSeedFailedAction;
}

@freezed
abstract class TurnOnAutoRefreshAction with _$TurnOnAutoRefreshAction {
  const factory TurnOnAutoRefreshAction() = _TurnOnAutoRefreshAction;
}

@freezed
abstract class TurnOffAutoRefreshAction with _$TurnOffAutoRefreshAction {
  const factory TurnOffAutoRefreshAction() = _TurnOffAutoRefreshAction;
}

@freezed
abstract class ValidateQrCodeAction with _$ValidateQrCodeAction {
  const factory ValidateQrCodeAction(String codeToValidate) = _ValidateQrCodeAction;
}

@freezed
abstract class ValidQrCodeAction with _$ValidQrCodeAction {
  const factory ValidQrCodeAction() = _ValidQrCodeAction;
}

@freezed
abstract class ExpiredQrCodeAction with _$ExpiredQrCodeAction {
  const factory ExpiredQrCodeAction() = _ExpiredQrCodeAction;
}

@freezed
abstract class ValidateQrCodeFailedAction with _$ValidateQrCodeFailedAction {
  const factory ValidateQrCodeFailedAction() = _ValidateQrCodeFailedAction;
}
