import 'package:equatable/equatable.dart';
import 'package:qr_code_test/blocs/validation/validation.dart';

/// States for the [ValidationBloc] bloc
abstract class ValidationState extends Equatable {
  final String code;
  const ValidationState(this.code);

  @override
  List<Object> get props => [];
}

/// Initial state of the validation process, where no validation has happened yet
class ValidationNone extends ValidationState {
  const ValidationNone() : super("");
}

/// Validation happened with success
class ValidationSuccess extends ValidationState {
  const ValidationSuccess(String code) : super(code);
}

/// Validation failed
class ValidationFailed extends ValidationState {
  const ValidationFailed(String code) : super(code);
}