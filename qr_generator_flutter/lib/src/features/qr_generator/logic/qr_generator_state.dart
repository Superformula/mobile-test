import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_generator/qr_generator.dart';

part 'qr_generator_state.freezed.dart';

///State representation for QrGeneration process
@freezed
abstract class QrGeneratorState with _$QrGeneratorState {
  /// Data is present state
  const factory QrGeneratorState.data({@required Seed seed}) = Data;

  /// Initial/default state
  const factory QrGeneratorState.initial() = Initial;

  /// Data is loading state
  const factory QrGeneratorState.loading() = Loading;

  /// Error when loading data state
  const factory QrGeneratorState.expired() = Expired;

  /// Error when loading data state
  const factory QrGeneratorState.error([String message]) = Error;
}
