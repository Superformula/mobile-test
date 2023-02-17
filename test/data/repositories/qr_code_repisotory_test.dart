import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:superformula_test/core/resources/result.dart';
import 'package:superformula_test/data/data_sources/qr_code_local_data_source.dart';
import 'package:superformula_test/data/data_sources/qr_code_remote_data_source.dart';
import 'package:superformula_test/data/errors/exception.dart';
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
        'WHEN the remote data source returns successfully SHOULD return [Result.success(QRCodeEntity)]',
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
        'WHEN the remote data source fails SHOULD return [Result.success(QRCodeModel)] from the local data source',
        () async {
          final localEntity = QRCodeModel(
            seed: 'Testing',
            expiresAt: DateTime.now().add(const Duration(minutes: 1)),
          );
          final repositoryResponse = QRCodeEntity(
            seed: localEntity.seed,
            expiresAt: localEntity.expiresAt,
          );

          when(() => qrCodeRemoteDataSource.getSeed())
              .thenThrow(const DataSourceException(error: '', message: ''));

          when(() => qrCodeLocalDataSource.getSeed())
              .thenAnswer((_) => SynchronousFuture(localEntity));

          final result = await qrCodeRepository.getSeed();

          expect(result, isA<SuccessResult>());
          expect(result.asSuccess.data, equals(repositoryResponse));
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
