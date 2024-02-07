import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/scan/scan_cubit.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/pages/scan/scan_page.dart';

void main() {
  group('ScanPage |', () {
    late final ScanCubit scanCubit;

    setUpAll(() {
      scanCubit = ScanCubit();
    });

    testWidgets('should find the QRView widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: scanCubit,
              child: const ScanPage(),
            ),
          ),
        ),
      );

      expect(find.byType(QRView), findsOneWidget);
    });

    testWidgets('shouldnt find ElevatedButton before emits ScannedDataState',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: scanCubit,
            child: const Scaffold(
              body: ScanPage(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ElevatedButton), findsNothing);

      scanCubit.emit(const ScannedDataState(data: 'test'));

      await tester.pumpAndSettle();

      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('test'), findsOneWidget);
    });
  });
}
