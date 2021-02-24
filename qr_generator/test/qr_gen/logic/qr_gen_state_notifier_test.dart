import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:qr_code_gen/qr_code_gen.dart';

import 'package:qr_gen/qr_gen.dart' show GetSeed, SeedModel;

import 'package:qr_generator/src/features/qr_gen/logic/qr_gen_provider.dart';
import 'package:qr_generator/src/features/qr_gen/logic/qr_gen_state.dart';

class MockGetSeed extends Mock implements GetSeed {}

class MockPainter extends Mock implements QrPainter {}

class MockGenerateQR extends Mock implements GenerateBaseQR {}

void main() {
  MockGetSeed getSeed;
  MockGenerateQR generateQR;
  QrGenNotifier notifier;

  setUp(() {
    getSeed = MockGetSeed();
    generateQR = MockGenerateQR();
    notifier = QrGenNotifier(getSeed: getSeed, generateBaseQR: generateQR);
  });

  group('QrGenNotifier', () {
    final tPainter = MockPainter();

    final tSeed = SeedModel(
      seed: 'myRandomSeed',
      expiresAt: DateTime.now().add(const Duration(seconds: 30)),
    );

    // Expected emitted states from notifier
    final tGetSeedStates = <String>[
      const Initial().toString(),
      const Loading().toString(),
      QRCode(qrPainter: tPainter, expiration: tSeed.expiresAt).toString(),
    ];

    test(
      'Should emit expected states when calling getSeed.',
      () async {
        // setup -> create the object to test
        when(getSeed()).thenAnswer(
          (_) => Future.value(Right<Failure, SeedModel>(tSeed)),
        );

        when(generateQR(any)).thenAnswer((_) => tPainter);

        final expectedStates = <String>[];
        notifier.addListener((state) => expectedStates.add(state.toString()));

        // side effects -> collect the result to test
        await notifier.getSeed();

        // expectations -> compare result to expected value
        expect(expectedStates, tGetSeedStates);
      },
    );
  });
}
