import 'dart:math';

import 'package:test/test.dart';
import 'package:superformula_scanner/providers/superformula_provider.dart';

void main() {

  group('Seed Verification', () {

    test('Seed Verification Fail', () async{
      final provider = SuperFormulaProvider();

      //Generate a random number as seed
      Random random = Random();
      int randomNumber = random.nextInt(100);
      await provider.verifySeedTest(seed: randomNumber.toString());

      expect(provider.isSeedValidTest,false);
    });


    test('Seed Verification Success', () async{
      final provider = SuperFormulaProvider();

      await provider.getSeedTest().then((value) => provider.verifySeedTest(seed: value));

      expect(provider.isSeedValidTest,true);
    });
  });
}