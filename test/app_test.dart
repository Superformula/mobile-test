import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/app/app.dart';
import 'package:mobile_test/home/home_screen.dart';

void main() {
  group('SuperformulaMobileTest', () {
    testWidgets('renders HomeScreen', (tester) async {
      await tester.pumpWidget(const SuperformulaApp());
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
