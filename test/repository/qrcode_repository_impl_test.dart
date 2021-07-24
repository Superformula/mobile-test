import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qrtestcodeone/data/datasource/qrcode_service_datasource.dart';
import 'package:qrtestcodeone/data/model/qr_seed_datamodel.dart';
import 'package:qrtestcodeone/data/repository/qrcode_repository_impl.dart';
import 'package:qrtestcodeone/domain/entity/qr_seed.dart';
import 'package:qrtestcodeone/domain/repository/qrcode_repository.dart';

import '../mock.mocks.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///

void main() {
  late QrCodeRepository repository;
  late QrCodeServiceDataSource dataSource;
  late QrSeedDataModel dataModel;

  setUp(() {
    dataModel = MockQrSeedDataModel();
    dataSource = MockMockQrCodeServiceDataSource();
    repository = QrCodeRepositoryImpl(dataSource);
  });

  test(
    'should return qr seed when request getSeed',
    () async {
      // arrange
      final QrSeed qrSeed = QrSeed(seed: '', expiresAt: DateTime.now());
      when(dataSource.getSeed()).thenAnswer((_) async => dataModel);
      when(dataModel.toQrSeed()).thenAnswer((_) => qrSeed);
      // act
      final result = await repository.getSeed();
      // assert
      expect(result, qrSeed);
      verify(dataSource.getSeed());
      verifyNoMoreInteractions(dataSource);
    },
  );
}
