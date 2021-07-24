import 'package:mockito/mockito.dart';
import 'package:qrtestcodeone/domain/entity/qr_seed.dart';
import 'package:qrtestcodeone/domain/repository/qrcode_repository.dart';
import 'package:qrtestcodeone/domain/usecase/get_qrcode_seed_usecase.dart';
import 'package:test/test.dart';

import '../mock.mocks.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///

void main() {
  late GetQrCodeSeedUseCase useCase;
  late QrCodeRepository repository;

  setUp(() {
    repository = MockMockQrCodeRepository();
    useCase = GetQrCodeSeedUseCase(repository);
  });

  test(
    'should get the corresponding qr seed from the repository',
    () async {
      // arrange
      final QrSeed qrSeed = QrSeed(seed: '', expiresAt: DateTime.now());
      when(repository.getSeed()).thenAnswer((_) async => qrSeed);
      // act
      final result = await useCase.call();
      // assert
      expect(result, qrSeed);
      verify(repository.getSeed());
      verifyNoMoreInteractions(repository);
    },
  );
}
