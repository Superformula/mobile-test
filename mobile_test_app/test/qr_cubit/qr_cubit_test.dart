import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test_app/model/qr_code.dart';
import 'package:mobile_test_app/cubits/qr_cubit/qr_cubit.dart';
import 'package:mobile_test_app/repository/qr_repository.dart';
import 'package:mockito/mockito.dart';

void main() {
  final testQrCode = QrCode(
    code: 'oIHRi_pQ_1DmT0yZUn5VFkWqLUgiHSyySjM3zUSxXpI=',
    expiresAt: DateTime.now().add(
      Duration(seconds: 2),
    ),
  );

  final qrRepository = MockQrRepository();

  setUpAll(() {
    when(qrRepository.seed()).thenAnswer(
      (realInvocation) => Future.value(testQrCode),
    );
  });

  blocTest<QrCubit, QrState>(
    'QRCubit emits the right state when a QR code is generated',
    build: () => QrCubit(repository: qrRepository),
    act: (cubit) async {
      await cubit.generateQrCode();
      cubit.setAutoRefresh(false);
      cubit.setAutoRefresh(true);
    },
    expect: [
      QrLoading(autoGenerate: true),
      QrGenerated(qrCode: testQrCode, autoGenerate: true),
      QrGenerated(qrCode: testQrCode, autoGenerate: false),
      QrGenerated(qrCode: testQrCode, autoGenerate: true),
    ],
  );
}

class MockQrRepository extends Mock implements QrRepository {}
