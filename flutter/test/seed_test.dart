// Import the test package and Counter class
import 'package:flutter/cupertino.dart';
import 'package:test/test.dart';
import 'package:superformula_scanner/providers/superformula_provider.dart';

void main() {
  test('Seed Verification Fail', () {
    final provider = SuperFormulaProvider();

    provider.verifySeedTest(seed: '0');

    expect(provider.isSeedValidTest,false);
  });
}