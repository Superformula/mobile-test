import 'package:flutter_test/flutter_test.dart';

import 'package:qr_gen/ui/widgets/expiry_panel.dart';
import 'util/locator.dart';
import 'util/wrapper.dart';
import 'package:qr_gen/ui/screens/generator.dart';

void main() {
  setupLocator();
  testWidgets('Generator screen test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(TestWrapper(GeneratorScreen()));
    await tester.pump(Duration.zero);

    // Verify that our expiration panel rendered.
    expect(find.byType(ExpiryPanel), findsOneWidget);
    expect(find.text('Request new code'), findsOneWidget);

    Finder loginButton = find.text('Request new code');
    await tester.tap(loginButton);
    await tester.pump();

    // Verify that our expiration panel rendered.
    expect(find.byType(ExpiryPanel), findsOneWidget);
  });
}
