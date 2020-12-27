import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_challenge/blocs/blocs.dart';

import '../mock_repositories.dart';

void main() async {
  blocTest(
    'QR bloc validates a valid seed',
    build: () => ValidateSeedBloc(qrRepository: MockQrRepository()),
    act: (ValidateSeedBloc qrBloc) async {
      await qrBloc.validateSeed(seed: 'seed');
    },
    expect: [
      isA<ValidatingSeed>(),
      isA<SeedValid>(),
    ],
  );

  blocTest(
    'QR bloc confirms seed is invalid',
    build: () =>
        ValidateSeedBloc(qrRepository: MockQrRepository(invalidSeed: true)),
    act: (ValidateSeedBloc qrBloc) async {
      await qrBloc.validateSeed(seed: 'seed');
    },
    expect: [
      isA<ValidatingSeed>(),
      isA<SeedInvalid>(),
    ],
  );

  blocTest(
    'QR bloc emits \'error\' state upon unsuccessful validate call',
    build: () => ValidateSeedBloc(qrRepository: MockQrRepository(error: true)),
    act: (ValidateSeedBloc qrBloc) async {
      await qrBloc.validateSeed(seed: 'seed');
    },
    expect: [
      isA<ValidatingSeed>(),
      isA<SeedError>(),
    ],
  );
}
