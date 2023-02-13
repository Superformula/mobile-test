import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/data/data_sources/qr_code_data_source.dart';
import 'package:superformula_test/data/errors/exception.dart';
import 'package:superformula_test/data/errors/failure.dart';
import 'package:superformula_test/data/model/qr_code_model.dart';
import 'package:superformula_test/data/repositories/qr_code_repository.dart';
import 'package:superformula_test/domain/entities/qr_code_entity.dart';
import 'package:superformula_test/domain/repositories/qr_code_repository.dart';

class QRCodeDataSourceMock extends Mock implements QRCodeDataSource {}

void main() {
  late final QRCodeDataSource qrCodeDataSource;
  late final QRCodeRepository qrCodeRepository;

  setUpAll(
    () {
      qrCodeDataSource = QRCodeDataSourceMock();
      qrCodeRepository = QRCodeRepositoryImpl(qrCodeDataSource);
    },
  );

  group(
    'getSeed [METHOD]',
    () {
      test(
        'WHEN the data source returns successfully SHOULD return [Result.success(QRCodeEntity)]',
        () async {
          final dataSourceResponse = QRCodeModel(
            seed: 'Testing',
            expiresAt: DateTime.now(),
          );
          final repositoryResponse = QRCodeEntity(
            seed: dataSourceResponse.seed,
            expiresAt: dataSourceResponse.expiresAt,
          );

          when(() => qrCodeDataSource.getSeed())
              .thenAnswer((_) async => dataSourceResponse);

          final result = await qrCodeRepository.getSeed();

          expect(result, isA<SuccessResult>());
          expect(result.asSuccess.data, equals(repositoryResponse));
        },
      );

      test(
        'WHEN the data source returns failure SHOULD return [Result.failure(RepositoryFailure)]',
        () async {
          when(() => qrCodeDataSource.getSeed())
              .thenThrow(DataSourceException(error: '', message: ''));

          final result = await qrCodeRepository.getSeed();

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
          when(() => qrCodeDataSource.validateQRCode())
              .thenAnswer((_) async => false);

          final result = await qrCodeRepository.validateQRCode();

          expect(result, isA<SuccessResult>());
          expect(result.asSuccess.data, isFalse);
        },
      );

      test(
        'WHEN the data source returns successfully SHOULD return [Result.success(true)]',
        () async {
          when(() => qrCodeDataSource.validateQRCode())
              .thenAnswer((_) async => true);

          final result = await qrCodeRepository.validateQRCode();

          expect(result, isA<SuccessResult>());
          expect(result.asSuccess.data, isTrue);
        },
      );
    },
  );
}
