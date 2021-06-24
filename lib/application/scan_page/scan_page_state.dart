part of 'scan_page_cubit.dart';

@freezed
abstract class ScanPageState with _$ScanPageState {
  const factory ScanPageState.initial() = _Initial;
  const factory ScanPageState.seedScanned({required String code}) =
      _CodeScanned;
  const factory ScanPageState.seedVerified({required String code}) =
      _SeedVerified;
  const factory ScanPageState.seedInvalid() = _SeedInvalid;
}
