import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_test/blocs/validation/validation.dart';

/// This bloc processes the data received from a QR code scan.
class ValidationBloc extends Bloc<String, ValidationState> {
  ValidationBloc() : super(const ValidationNone());

  /// Checks whether the given scanned value is valid or not.
  ///
  /// This is a simple check just for the sake of the example.
  bool isValid(String value) => value.length <= 32;

  @override
  Stream<ValidationState> mapEventToState(String event) async* {
    if (isValid(event)) {
      yield ValidationSuccess(event);
    } else {
      yield ValidationFailed(event);
    }
  }
}