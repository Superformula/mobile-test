import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_test/blocs/validation/validation.dart';
import 'package:qr_code_test/routes/qr_validation_page/validation_alert.dart';

/// This route simply tells the user whether the scanned QR code is valid or not
class QRValidationRoute extends StatelessWidget {
  const QRValidationRoute();

  @override
  Widget build(BuildContext context) {
    // This page is reached only when the state of the bloc is of type 'ValidationFailed'
    // or 'ValidationSuccess'.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Validation state"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ValidationBloc, ValidationState>(
          builder: (context, state) {
            // Invalid code
            if (state is ValidationFailed) {
              return const ValidationAlert(
                message: "Invalid code!",
                success: false,
              );
            }

            // Valid code
            return const ValidationAlert(
              message: "Valid code!",
              success: true,
            );
          },
        ),
      ),
    );
  }
}