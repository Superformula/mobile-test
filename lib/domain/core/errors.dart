import 'failures.dart';

/// Error that extends Error to support the ValueFailure Type
class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;
  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminnating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
