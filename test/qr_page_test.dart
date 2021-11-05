import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sf_qr_code/features/qr/bloc/qr_bloc.dart';
import 'package:sf_qr_code/features/qr/models/seed_response.dart';
import 'package:sf_qr_code/features/qr/ui/qr_page.dart';

import 'test_utils/page_matrialized.dart';

class MockQrBloc extends MockBloc<QrEvent, QrState> implements QrBloc {}

class QrStateFake extends Fake implements QrState {}

class QrEventFake extends Fake implements QrEvent {}

void main() {
  late MockQrBloc mockQrBloc;
  late PageMaterializer pageMaterialized;

  const SeedResponse seedResponse =
      SeedResponse(seed: "11234567uytee", expiresAt: "2030-11-12T13:10:42.24Z");

  setUp(() {
    registerFallbackValue<QrState>(QrStateFake());
    registerFallbackValue<QrEvent>(QrEventFake());
    mockQrBloc = MockQrBloc();
    when(() => mockQrBloc.state)
        .thenReturn(QrSeedResponseSuccessfulState(seedData: seedResponse));
    pageMaterialized = PageMaterializer(
      home: BlocProvider<QrBloc>.value(value: mockQrBloc, child: QRPage()),
    );
  });
  testWidgets('QR Page widget test', (WidgetTester tester) async {
    await tester.pumpWidget(pageMaterialized);
    expect(find.text('QR CODE'), findsOneWidget);
  });
}
