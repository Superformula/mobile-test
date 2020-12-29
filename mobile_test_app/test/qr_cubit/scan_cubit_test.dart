import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test_app/repository/qr_repository.dart';
import 'package:mobile_test_app/scan_cubit/scan_cubit.dart';
import 'package:mockito/mockito.dart';

void main() {
  const testCode = 'oIHRi_pQ_1DmT0yZUn5VFkWqLUgiHSyySjM3zUSxXpI=';

  final qrRepository = MockQrRepository();

  setUpAll(() {
    when(qrRepository.validate(any)).thenAnswer(
      (realInvocation) async {
        if (realInvocation.positionalArguments.first == testCode) {
          return true;
        } else {
          return false;
        }
      },
    );
  });

  blocTest<ScanCubit, ScanState>(
    'ScanCubit emits the right state when a QR code is scanned',
    build: () => ScanCubit(repository: qrRepository),
    act: (cubit) async {
      await cubit.validateCode(testCode);
      cubit.reset();
      cubit.validateCode('An invalid code');
    },
    expect: [
      CodeValidatingState(),
      CodeValidState(),
      ScanInitial(),
      CodeValidatingState(),
      CodeInvalidState(),
    ],
  );
}

class MockQrRepository extends Mock implements QrRepository {}
