import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_generator_app/feature/display_qr/display_qr_state.dart';
import 'package:qr_generator_app/feature/display_qr/display_qr_state_notifier.dart';
import 'package:qr_generator_app/model/qr_data.dart';
import 'package:qr_generator_app/network/api.dart';

import 'display_qr.mocks.dart';

@GenerateMocks([Api])
void main() {
  group("state notifier", () {
    test("should display error when api fails", () async {
      final api = MockApi();
      final stateNotifier = DisplayQrStateNotifier(api);

      when(api.getSeed()).thenThrow(Exception("mockito exception"));

      final List<DisplayQrState> actual = [];
      stateNotifier.addListener((state) => actual.add(state));

      await stateNotifier.getSeed();

      expect(actual, [
        const DisplayQrState.initial(),
        const DisplayQrState.loading(),
        const DisplayQrState.error()
      ]);
    });

    test("should display success when api succeeds", () async {
      final api = MockApi();
      final stateNotifier = DisplayQrStateNotifier(api);

      final QrData expected = QrData("seed value", DateTime.utc(2021));
      when(api.getSeed()).thenAnswer((_) async => expected);

      final List<DisplayQrState> actual = [];
      stateNotifier.addListener((state) => actual.add(state));

      await stateNotifier.getSeed();

      expect(actual, [
        const DisplayQrState.initial(),
        const DisplayQrState.loading(),
        DisplayQrState.success(expected)
      ]);
    });
  });
}
