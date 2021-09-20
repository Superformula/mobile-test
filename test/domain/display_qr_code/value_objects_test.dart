import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_mobile_test/domain/core/either.dart';
import 'package:superformula_mobile_test/domain/core/failures.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_data.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_expiration_date.dart';

void main() {
  group('QrSeedData: ', () {
    setUp(() {
      // run before all tests
    });

    test('Should be RIGHT if created with a valid string', () {
      // arrange
      const testSeedData = 'd43397d129c3de9e4b6c3974c1c16d1f';

      // act
      final qrSeedData = QrSeedData(testSeedData);

      // assert
      expect(qrSeedData.isValid(), true);
      expect(qrSeedData.value,
          const Either<ValueFailure, String>.right(testSeedData));
    });

    test('Should be LEFT MultilineFailure if created with a multiline string',
        () {
      // arrange
      // same size but multiline
      const testSeeds = [
        'd43397d129c3de9e4b6c3974c1c16ds\n',
        'd43397d129\r3de9e4b\n6c3974c1c16ds',
        'd43397d1293de9e4b6c3974c1c16ds\n\r',
        '\n\rd43397d1293de9e4b6c3974c1c16ds',
      ];

      for (final seed in testSeeds) {
        // arrange
        final qrSeedData = QrSeedData(seed);

        // assert
        expect(qrSeedData.isValid(), false);
        expect(
          qrSeedData.value,
          Either<ValueFailure<String>, String>.left(
              ValueFailure.multilineString(failedValue: seed)),
        );
      }
    });

    test(
        'Should be LEFT invalidLenght if created with a string with unextepcted size',
        () {
      // arrange
      // Bigger than allowed
      const testSeeds = [
        'asadasdasdasds', // too short
        'iksuagdiag2g8o712gdo872ghd12gd8g2y1g2iuydgo1u2dg' // too long
      ];

      for (final seed in testSeeds) {
        // act
        final qrSeedData = QrSeedData(seed);

        // assert
        expect(qrSeedData.isValid(), false);
        expect(
            qrSeedData.value,
            Either<ValueFailure<String>, String>.left(
                ValueFailure.invalidLenghtString(
                    failedValue: seed, maxAllowedLenght: 32)));
      }
    });

    test('Should be LEFT Empty if created with an empty string', () {
      // arrange
      const testSeed = '';

      // act
      final qrSeedData = QrSeedData(testSeed);

      // assert
      expect(qrSeedData.isValid(), false);
      expect(
          qrSeedData.value,
          const Either<ValueFailure<String>, String>.left(
              ValueFailure.empty(failedValue: testSeed)));
    });
  });

  group('QrSeedExpirationDate: ', () {
    // ignore: unused_local_variable
    late DateTime currentDateMock;

    setUp(() {
      currentDateMock = DateTime.parse('1979-11-12T13:10:12.24Z');
    });

    test('Should be RIGHT if created with a valid ISO dateTime string', () {
      // arrange
      const validIsoDateTime = '1979-11-12T13:10:17.24Z';

      // act
      final qrExpirationDate =
          QrSeedExpirationDate.withString(validIsoDateTime);

      // assert
      expect(qrExpirationDate.isValid(), true);
      expect(
          qrExpirationDate.value,
          Either<ValueFailure, DateTime>.right(
              DateTime.parse(validIsoDateTime)));
    });

    test('Should be LEFT if created with a invalid ISO dateTime string', () {
      // arrange
      const invalidIsoDateTime = 'yya1979-11-12T13:10:17.24Z';

      // act
      final qrExpirationDate =
          QrSeedExpirationDate.withString(invalidIsoDateTime);

      // assert
      expect(qrExpirationDate.isValid(), false);
      expect(
          qrExpirationDate.value,
          const Either<ValueFailure, DateTime>.left(
              ValueFailure<DateTime>.invalidIsoFormat(
                  failedValue: invalidIsoDateTime)));
    });
  });
}
