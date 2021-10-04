import 'package:flutter_test/flutter_test.dart';
import 'package:seed_reader/app.dart';

void main() {
  testWidgets('render components', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    await tester.pumpAndSettle();

    expect(find.text('hello world'), findsOneWidget);
  });
}
