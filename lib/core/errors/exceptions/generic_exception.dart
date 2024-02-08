import 'package:superformula_leandro/core/constants/strings_constants.dart';

final class GenericException implements Exception {
  const GenericException({
    required this.error,
    required this.stackTrace,
  });
  final String message = StringsConstants.somethingWentWrongTryAgainLater;
  final Object error;
  final StackTrace stackTrace;
}
