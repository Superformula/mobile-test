import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:qr_app/pages/home/widgets/menu.dart';
import 'package:qr_app/pages/home/widgets/menu_item.dart';

void main() {
  Widget createWidget([OnMenuPress callback]) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Menu(
          onPress: (menuItem) {
            if (callback != null) callback(menuItem);
          },
        ),
      ),
    );
  }

  testWidgets('Menu Animation', (WidgetTester tester) async {
    await tester.pumpWidget(createWidget());
    final menuItems = find.byType(MenuItem).evaluate();
    final scan = menuItems.first.widget as MenuItem;
    final qrCode = menuItems.last.widget as MenuItem;

    expect(scan.title, 'Scan');
    expect(scan.fadeAnimation.value, 0);
    expect(scan.slideAnimation.value, Offset(0, 2));

    expect(qrCode.title, 'QR Code');
    expect(qrCode.fadeAnimation.value, 0);
    expect(qrCode.slideAnimation.value, Offset(0, 1));

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(Duration(microseconds: 500));

    expect(scan.fadeAnimation.value, 1);
    expect(scan.slideAnimation.value, Offset(0, 0));
    expect(qrCode.fadeAnimation.value, 1);
    expect(qrCode.slideAnimation.value, Offset(0, 0));
  });
  testWidgets('Menu Click', (WidgetTester tester) async {
    MenuName selectedItem;
    await tester.pumpWidget(createWidget((item) => selectedItem = item));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(Duration(microseconds: 500));

    await tester.tap(find.byIcon(Icons.scatter_plot_rounded));
    await tester.pump();
    expect(selectedItem, MenuName.Scan);

    await tester.tap(find.byIcon(Icons.qr_code));
    await tester.pump();
    expect(selectedItem, MenuName.QRCode);
  });
}
