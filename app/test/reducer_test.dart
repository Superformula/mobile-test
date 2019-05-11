import 'package:flutter_test/flutter_test.dart';
import 'package:supercode/models.dart';
import 'package:supercode/redux/actions.dart';
import 'package:supercode/redux/app_state.dart';
import 'package:supercode/redux/reducers.dart';

void main() {
  group('Reducers - ', () {
    test('fetchQRCodeReducer', () {
      expect(
        fetchQRCodeReducer(AppState.initial(), FetchQRCode()),
        AppState.initial().rebuild((b) => b..loading = true),
      );
    });
    test('fetchQRCodeSuccessReducer', () {
      final seed = Seed('abc123', DateTime(2019, 5, 5, 1, 1, 2));
      final now = DateTime(2019, 5, 5, 1, 1, 1);

      final state = AppState.initial().rebuild((b) => b..loading = false);
      expect(
          fetchQRCodeSuccessReducer(
            state,
            FetchQRCodeSuccess(seed),
            mockNow: now,
          ),
          AppState.initial().rebuild(
            (b) => b
              ..loading = false
              ..timerDurationSeconds = 1
              ..activeSeed = seed,
          ));
    });
    test('fetchQRCodeSuccessReducer less than 0', () {
      final seed = Seed('abc123', DateTime(2019, 5, 5, 1, 1, 1));
      final now = DateTime(2019, 5, 5, 1, 1, 2);

      final state = AppState.initial().rebuild((b) => b..loading = false);
      expect(
          fetchQRCodeSuccessReducer(
            state,
            FetchQRCodeSuccess(seed),
            mockNow: now,
          ),
          AppState.initial().rebuild(
            (b) => b
              ..loading = false
              ..timerDurationSeconds = 0
              ..activeSeed = seed,
          ));
    });
    test('validateCodeSuccessReducer', () {
      final state = AppState.initial().rebuild((b) => b..validating = true);
      expect(
        validateCodeSuccessReducer(state, ValidateCodeSuccess(true)),
        AppState.initial().rebuild((b) => b
          ..validating = false
          ..codeIsValid = true),
      );
    });

    test('resetValidateReducer', () {
      final state = AppState.initial().rebuild((b) => b
        ..validating = true
        ..codeIsValid = true);
      expect(resetValidateReducer(state, ResetValidate()), AppState.initial());
    });
  });
}
