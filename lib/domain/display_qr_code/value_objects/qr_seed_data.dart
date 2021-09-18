import 'package:superformula_mobile_test/domain/core/either.dart';
import 'package:superformula_mobile_test/domain/core/failures.dart';
import 'package:superformula_mobile_test/domain/core/value_object.dart';
import 'package:superformula_mobile_test/domain/core/value_validators.dart';

const seedValidLenght = 32;

class QrSeedData extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory QrSeedData(String value) {
    return QrSeedData._(validateStringNotEmpty(value)
        .flatMap((rightValue) => validateSingleLine(value))
        .flatMap((rightValue) => validateStringLenght(value, seedValidLenght)));
  }

  const QrSeedData._(this.value);
}
