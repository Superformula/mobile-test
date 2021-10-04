import 'package:flutter_test/flutter_test.dart';
import 'package:seed_reader/generated/l10n.dart';
import 'package:seed_reader/routes/home/components/home_actions_button.dart';
import 'package:seed_reader/routes/home/home_page.dart';
import '../../common/base_testable_widget.dart';

void main() {
  testWidgets('render components', (WidgetTester tester) async {
    await tester.pumpWidget(
      const BaseWidgetTest(
        child: HomePage(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text(S.current.homePageTitle), findsOneWidget);
    expect(find.byType(HomeActionsButton), findsOneWidget);
  });
}
