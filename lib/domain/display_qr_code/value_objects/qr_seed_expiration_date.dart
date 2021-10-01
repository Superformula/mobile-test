import 'package:superformula_mobile_test/domain/core/either.dart';
import 'package:superformula_mobile_test/domain/core/failures.dart';
import 'package:superformula_mobile_test/domain/core/value_object.dart';
import 'package:superformula_mobile_test/domain/core/value_validators.dart';

class QrSeedExpirationDate extends ValueObject<DateTime> {
  @override
  final Either<ValueFailure<DateTime>, DateTime> value;

  factory QrSeedExpirationDate(DateTime value) {
    return QrSeedExpirationDate._(Either.right(value));
  }

  factory QrSeedExpirationDate.withString(String value) {
    return validateIsoDateTimeFormat(value).when(left: (left) {
      return QrSeedExpirationDate._(
          Either<ValueFailure<DateTime>, DateTime>.left(left));
    }, right: (right) {
      return QrSeedExpirationDate(DateTime.parse(right));
    });
  }

  const QrSeedExpirationDate._(this.value);
}
