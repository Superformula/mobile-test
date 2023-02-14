import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/data/data_sources/qr_code_local_data_source.dart';
import 'package:superformula_test/data/data_sources/qr_code_remote_data_source.dart';
import 'package:superformula_test/data/errors/exception.dart';
import 'package:superformula_test/data/errors/failure.dart';
import 'package:superformula_test/data/model/qr_code_model.dart';
import 'package:superformula_test/data/repositories/qr_code_repository.dart';
import 'package:superformula_test/domain/entities/qr_code_entity.dart';
import 'package:superformula_test/domain/repositories/qr_code_repository.dart';

class QRCodeRemoteDataSourceMock extends Mock
    implements QRCodeRemoteDataSource {}

class QRCodeLocalDataSourceMock extends Mock implements QRCodeLocalDataSource {}

void main() {
  late final QRCodeRemoteDataSource qrCodeRemoteDataSource;
  late final QRCodeLocalDataSource qrCodeLocalDataSource;
  late final QRCodeRepository qrCodeRepository;

  setUpAll(
    () {
      qrCodeRemoteDataSource = QRCodeRemoteDataSourceMock();
      qrCodeLocalDataSource = QRCodeLocalDataSourceMock();
      qrCodeRepository = QRCodeRepositoryImpl(
        remoteDataSource: qrCodeRemoteDataSource,
        localDataSource: qrCodeLocalDataSource,
      );
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

          when(() => qrCodeRemoteDataSource.getSeed())
              .thenAnswer((_) async => dataSourceResponse);

          final result = await qrCodeRepository.getSeed();

          expect(result, isA<SuccessResult>());
          expect(result.asSuccess.data, equals(repositoryResponse));
        },
      );

      test(
        'WHEN the data source returns failure SHOULD return [Result.failure(RepositoryFailure)]',
        () async {
          when(() => qrCodeRemoteDataSource.getSeed())
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
          when(() => qrCodeRemoteDataSource.validateQRCode())
              .thenAnswer((_) async => false);

          final result = await qrCodeRepository.validateQRCode();

          expect(result, isA<SuccessResult>());
          expect(result.asSuccess.data, isFalse);
        },
      );

      test(
        'WHEN the data source returns successfully SHOULD return [Result.success(true)]',
        () async {
          when(() => qrCodeRemoteDataSource.validateQRCode())
              .thenAnswer((_) async => true);

          final result = await qrCodeRepository.validateQRCode();

          expect(result, isA<SuccessResult>());
          expect(result.asSuccess.data, isTrue);
        },
      );
    },
  );
}
