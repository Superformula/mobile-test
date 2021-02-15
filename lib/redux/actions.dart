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

class TurnOnAutoRefreshAction {}

class TurnOffAutoRefreshAction {}
