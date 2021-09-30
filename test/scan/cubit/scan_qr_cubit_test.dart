import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/base/result_state.dart';
import 'package:mobile_test/scan/cubit/scan_qr_cubit.dart';

void main() {
  group('$ScanQrCubit::', () {
    test('initial state is Initial', () {
      expect(ScanQrCubit().state, const Initial<String>());
    });

    blocTest<ScanQrCubit, ResultState<String>>(
      'emits [ResultState.data] when scanQrCodeSuccess is called.',
      build: () => ScanQrCubit(),
      act: (bloc) => bloc.scanQrCodeSuccess('code'),
      expect: () => const <ResultState<String>>[ResultState.data('code')],
    );

    blocTest<ScanQrCubit, ResultState<String>>(
      'emits [ResultState.error] when scanQrCodeFailure is called.',
      build: () => ScanQrCubit(),
      act: (bloc) => bloc.scanQrCodeFailure('error message'),
      expect: () => const <ResultState<String>>[
        ResultState.error('error message'),
      ],
    );
  });
}
