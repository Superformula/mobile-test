import 'package:flutter_test/flutter_test.dart';

import 'util/locator.dart';
import 'util/wrapper.dart';
import 'package:qr_gen/ui/screens/home.dart';

void main() {
  setupLocator();
  testWidgets('Home screen test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(TestWrapper(HomeScreen(
      title: 'Home',
    )));
    await tester.pump(Duration.zero);
    // Verify that our counter starts at 0.
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Welcome to QrGen'), findsOneWidget);
  });
}
