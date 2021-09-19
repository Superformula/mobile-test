import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.empty({required T failedValue}) = Empty<T>;
  const factory ValueFailure.multilineString({required String failedValue}) =
      MultilineString<T>;
  const factory ValueFailure.invalidLenghtString(
      {required String failedValue,
      required int maxAllowedLenght}) = InvalidLenghtString<T>;
  const factory ValueFailure.invalidIsoFormat({required String failedValue}) =
      InvalidIsoFormat<T>;
}
