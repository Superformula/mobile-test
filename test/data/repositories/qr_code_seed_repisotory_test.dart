import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/data/data_sources/qr_code_seed_data_source.dart';
import 'package:superformula_test/data/errors/exception.dart';
import 'package:superformula_test/data/errors/failure.dart';
import 'package:superformula_test/data/model/qr_code_seed_model.dart';
import 'package:superformula_test/data/repositories/qr_code_seed_repository.dart';
import 'package:superformula_test/domain/entities/qr_code_seed_entity.dart';
import 'package:superformula_test/domain/repositories/qr_code_seed_repository.dart';

class QrCodeSeedDataSourceMock extends Mock implements QrCodeSeedDataSource {}

void main() {
  late final QrCodeSeedDataSource qrCodeSeedDataSource;
  late final QrCodeSeedRepository qrCodeSeedRepository;

  setUpAll(
    () {
      qrCodeSeedDataSource = QrCodeSeedDataSourceMock();
      qrCodeSeedRepository = QrCodeSeedRepositoryImpl(qrCodeSeedDataSource);
    },
  );

  group(
    'getSeed [METHOD]',
    () {
      test(
        'WHEN the data source returns successfully SHOULD return [Result.success(QrCodeSeedEntity)]',
        () async {
          final dataSourceResponse = QrCodeSeedModel(
            seed: 'Testing',
            expiresAt: DateTime.now(),
          );
          final repositoryResponse = QrCodeSeedEntity(
            seed: dataSourceResponse.seed,
            expiresAt: dataSourceResponse.expiresAt,
          );

          when(() => qrCodeSeedDataSource.getSeed())
              .thenAnswer((_) async => dataSourceResponse);

          final result = await qrCodeSeedRepository.getSeed();

          expect(result, isA<SuccessResult>());
          expect(result.asSuccess.data, equals(repositoryResponse));
        },
      );

      test(
        'WHEN the data source returns failure SHOULD return [Result.failure(RepositoryFailure)]',
        () async {
          when(() => qrCodeSeedDataSource.getSeed())
              .thenThrow(DataSourceException(error: '', message: ''));

          final result = await qrCodeSeedRepository.getSeed();

          expect(result, isA<FailureResult>());
          expect(result.asFailure.failure, isA<RepositoryFailure>());
        },
      );
    },
  );

  group(
    'validateQRCode [METHOD]',
    () {
      test(
        'WHEN the data source returns successfully SHOULD return [Result.success(false)]',
        () async {
          when(() => qrCodeSeedDataSource.validateQRCode())
              .thenAnswer((_) async => false);

          final result = await qrCodeSeedRepository.validateQRCode();

          expect(result, isA<SuccessResult>());
          expect(result.asSuccess.data, isFalse);
        },
      );

      test(
        'WHEN the data source returns successfully SHOULD return [Result.success(true)]',
        () async {
          when(() => qrCodeSeedDataSource.validateQRCode())
              .thenAnswer((_) async => true);

          final result = await qrCodeSeedRepository.validateQRCode();

          expect(result, isA<SuccessResult>());
          expect(result.asSuccess.data, isTrue);
        },
      );
    },
  );
}
