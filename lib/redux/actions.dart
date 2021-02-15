import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code/model/seed.dart';

part 'actions.freezed.dart';

class FetchSeedAction {}

@freezed
abstract class SeedLoadedAction with _$SeedLoadedAction {
  const factory SeedLoadedAction(Seed seed) = _SeedLoadedAction;
}
