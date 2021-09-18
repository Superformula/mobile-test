import 'package:freezed_annotation/freezed_annotation.dart';
import 'either.dart';
import 'errors.dart';
import 'failures.dart';

// part 'value_objects.freezed.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Value($value)';
  }

  bool isValid() {
    return value.when(left: (v) => false, right: (v) => true);
  }

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    return value.when(
        left: (failure) => throw UnexpectedValueError(failure), right: id);
  }
}
