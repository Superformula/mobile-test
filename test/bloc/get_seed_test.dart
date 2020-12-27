import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_challenge/blocs/blocs.dart';

import '../mock_repositories.dart';

void main() async {
  blocTest(
    'QR bloc emits Seed upon successful getSeed call',
    build: () => GetSeedBloc(qrRepository: MockQrRepository()),
    act: (GetSeedBloc qrBloc) async {
      await qrBloc.getSeed();
    },
    expect: [
      isA<SeedLoading>(),
      isA<SeedLoaded>(),
    ],
  );

  blocTest(
    'QR bloc emits \'error\' state upon unsuccessful getSeed call',
    build: () => GetSeedBloc(qrRepository: MockQrRepository(error: true)),
    act: (GetSeedBloc qrBloc) async {
      await qrBloc.getSeed();
    },
    expect: [
      isA<SeedLoading>(),
      isA<SeedError>(),
    ],
  );
}
