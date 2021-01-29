import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qrcodevalidator/app/widgets/fancy_fab_widget.dart';

void main() {
  testWidgets('FancyFabWidget displays nothing if no action is informed',
      (WidgetTester tester) async {
    await tester.pumpWidget(FancyFabWidget());
    expect(find.byType(Container), findsOneWidget);
  });

  testWidgets('FancyFabWidget displays toggle and action',
      (WidgetTester tester) async {
    var actions = [
      FancyFabAction(
        label: 'label',
        icon: Icons.add,
      )
    ];

    const tooltip = 'toggle_fab';

    await tester.pumpWidget(
      _renderFloatingActionButtonNeededParents(tooltip, actions),
    );

    expect(find.byTooltip(actions[0].label), findsOneWidget);
    expect(find.byTooltip(tooltip), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsNWidgets(2));
  });

  testWidgets('FancyFabWidget check actions expand and retract',
      (WidgetTester tester) async {
    var actions = [
      FancyFabAction(
        label: 'label1',
        icon: Icons.add,
      ),
      FancyFabAction(
        label: 'label2',
        icon: Icons.remove,
      ),
    ];

    const tooltip = 'toggle_fab';

    await tester.pumpWidget(
      _renderFloatingActionButtonNeededParents(tooltip, actions),
    );

    // Check if all actions are retracted.
    expect(
        _getFabMainContainerBySize(
            FancyFabWidget.buttonSize, FancyFabWidget.buttonSize),
        findsOneWidget);

    await tester.tap(find.byTooltip(tooltip));

    await tester.pumpAndSettle();

    // Check if all actions are expanded.
    expect(
        _getFabMainContainerBySize(
            null,
            ((actions.length + 1) * FancyFabWidget.buttonSize) +
                (FancyFabWidget.buttonSpacing * actions.length + 1)),
        findsOneWidget);

    await tester.tap(find.byTooltip(tooltip));

    await tester.pumpAndSettle();

    // Check if all actions are retracted again.
    expect(
        _getFabMainContainerBySize(
            FancyFabWidget.buttonSize, FancyFabWidget.buttonSize),
        findsOneWidget);
  });
}

Finder _getFabMainContainerBySize(double w, double h) {
  return find.byWidgetPredicate((Widget widget) {
    if (widget is Container && widget.constraints != null) {
      return (w == null ||
              widget.constraints.widthConstraints().minWidth == w) &&
          widget.constraints.heightConstraints().minHeight == h;
    }

    return false;
  });
}

_renderFloatingActionButtonNeededParents(
    String tooltip, List<FancyFabAction> actions) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: Overlay(
      initialEntries: <OverlayEntry>[
        OverlayEntry(
          builder: (BuildContext context) => FancyFabWidget(
            tooltip: tooltip,
            actions: actions,
          ),
        )
      ],
    ),
  );
}
