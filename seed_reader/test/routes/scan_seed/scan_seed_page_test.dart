import 'package:flutter_test/flutter_test.dart';
import 'package:seed_reader/generated/l10n.dart';
import 'package:seed_reader/routes/scan_seed/scan_seed_page.dart';
import '../../common/base_testable_widget.dart';

void main() {
  testWidgets('render components', (WidgetTester tester) async {
    await tester.pumpWidget(
      const BaseWidgetTest(
        child: ScanSeedPage(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text(S.current.scanPageTitle), findsOneWidget);
  });
}
