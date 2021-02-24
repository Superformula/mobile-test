import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:qr_generator/src/app.dart';
import 'package:qr_generator/src/features/home/views/home_page.i18n.dart';
import 'package:qr_generator/src/features/qr_gen/logic/qr_gen_provider.dart';

class MockQRGenNotifier extends Mock implements QrGenNotifier {}

void main() {
  MockQRGenNotifier mockQRGenNotifier;

  setUp(() {
    mockQRGenNotifier = MockQRGenNotifier();
  });

  testWidgets(
    'Render default "no items" message.',
    (tester) async {
      // setup -> create the object to test
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            qrGenNotifierProvider.overrideWithValue(mockQRGenNotifier),
          ],
          child: QRGeneratorApp(),
        ),
      );

      // expectations -> compare result to expected value
      expect(find.text('${kNoItemsMessage.i18n}'), findsWidgets);
    },
  );
}
