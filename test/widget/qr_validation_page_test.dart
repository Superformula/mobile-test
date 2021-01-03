import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_test/routes/home_page/home_body.dart';
import 'package:qr_code_test/routes/qr_validation_page.dart';
import 'package:qr_code_test/routes/qr_validation_page/validation_alert.dart';
import 'utils/bloc_mocks.dart';

void main() {
  ValidationBloc validationBloc;

  setUpAll(() {
    validationBloc = MockValidationBloc();
  });

  group("QR Validation page rendering tests", () {
    testWidgets("Making sure the page shows a success message when the validation "
        "actually succeeded", (tester) async {
      // Mocking the bloc response
      when(validationBloc.state).thenReturn(const ValidationSuccess("ok"));

      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<ValidationBloc>.value(value: validationBloc),
        ],
        child: MaterialApp(
          home: const QRValidationRoute(),
        ),
      ));

      // App bar
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text("Validation state"), findsOneWidget);

      // Body
      expect(find.byType(ValidationAlert), findsOneWidget);
      expect(find.text("Valid code!"), findsOneWidget);
      expect(validationBloc.state.code, equals("ok"));
    });

    testWidgets("Making sure the page shows a success message when the validation "
        "actually succeeded", (tester) async {
      // Mocking the bloc response
      when(validationBloc.state).thenReturn(const ValidationFailed("fail"));

      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<ValidationBloc>.value(value: validationBloc),
        ],
        child: MaterialApp(
          home: const QRValidationRoute(),
        ),
      ));

      // App bar
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text("Validation state"), findsOneWidget);

      // Body
      expect(find.byType(ValidationAlert), findsOneWidget);
      expect(find.text("Invalid code!"), findsOneWidget);
      expect(validationBloc.state.code, equals("fail"));
    });
  });
}