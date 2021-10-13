import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/widgets/expandable_fab.dart';

import '../helpers/pump_app.dart';

void main() {
  const items = [
    ExpandableItem(icon: Icons.add),
    ExpandableItem(icon: Icons.remove),
  ];

  testWidgets('fab appears on screen', (widgetTester) async {
    await widgetTester.pumpApp(
      const Material(child: ExpandableFab(items: items)),
    );
    final menuFab = find.byKey(const Key('menu_action_button'));
    expect(menuFab, findsOneWidget);
  });

  testWidgets('on press appears the expandable items', (widgetTester) async {
    await widgetTester.pumpApp(
      const Material(child: ExpandableFab(items: items)),
    );
    final menuFab = find.byKey(const Key('menu_action_button'));
    await widgetTester.press(menuFab);
    final expandableItems = find.byType(ExpandableItem);
    expect(expandableItems, findsNWidgets(items.length));
  });
}
