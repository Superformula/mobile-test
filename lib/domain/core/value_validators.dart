import 'either.dart';
import 'failures.dart';

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return Either.right(input);
  } else {
    return Either.left(ValueFailure<String>.empty(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (!input.contains('\n') && !input.contains('\r')) {
    return Either.right(input);
  } else {
    return Either.left(
        ValueFailure<String>.multilineString(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateStringLenght(
    String input, int lenght) {
  if (input.length == lenght) {
    return Either.right(input);
  } else {
    return Either.left(
        ValueFailure<String>.invalidLenghtString(failedValue: input));
  }
}
