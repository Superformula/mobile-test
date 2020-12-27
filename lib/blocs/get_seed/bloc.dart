import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_challenge/blocs/get_seed/get_seed.dart';
import 'package:superformula_challenge/models/models.dart';
import 'package:superformula_challenge/repositories/repositories.dart';

class GetSeedBloc extends Cubit<GetSeedState> {
  final QrRepository qrRepository;

  GetSeedBloc({
    @required this.qrRepository,
  }) : super(SeedNotLoaded());

  Future getSeed() async {
    emit(SeedLoading());
    var result = await qrRepository.getSeed();
    if (result is Seed) {
      emit(SeedLoaded(seed: result));
    } else if (result is DioError) {
      emit(SeedError(error: result.message));
    } else {
      emit(SeedNotLoaded());
    }
  }
}
