import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_test/blocs/validation/validation.dart';

/// This bloc processes the data received from a QR code scan.
class ValidationBloc extends Bloc<String, ValidationState> {
  ValidationBloc() : super(const ValidationNone());

  /// Checks whether the given scanned value is valid or not.
  ///
  /// This is a simple check just for the sake of the example. Actually, this
  /// method could contain a more elaborated validation logic, such as:
  ///
  /// ```dart
  /// bool isValid(String value) async {
  ///   if (value.length > 32) {
  ///     return false;
  ///   }
  ///
  ///   final client = SomeHttpClient();
  ///   return await client.validate(value);
  /// }
  /// ```
  ///
  /// Regardless the implementation, the method should return a simple `bool`
  /// value so that `isValid` can be easily put inside an `if` statement.
  bool isValid(String value) => value.isNotEmpty && value.length <= 32;

  @override
  Stream<ValidationState> mapEventToState(String event) async* {
    if (isValid(event)) {
      yield ValidationSuccess(event);
    } else {
      yield ValidationFailed(event);
    }
  }
}