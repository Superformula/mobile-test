import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_challenge/blocs/blocs.dart';
import 'package:superformula_challenge/repositories/repositories.dart';

class ValidateSeedBloc extends Cubit<ValidateSeedState> {
  final QrRepository qrRepository;

  ValidateSeedBloc({
    @required this.qrRepository,
  }) : super(SeedNotValidated());

  Future validateSeed({
    @required String seed,
  }) async {
    emit(ValidatingSeed());
    var result = await qrRepository.validateSeed(seed: seed);
    if (result is bool) {
      if (result) {
        emit(SeedValid(seed: seed));
      } else {
        emit(SeedInvalid());
      }
    } else if (result is DioError) {
      emit(SeedValidationError(error: result.message));
    } else {
      emit(SeedNotValidated());
    }
  }
}
