import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_challenge/blocs/qr/qr.dart';
import 'package:superformula_challenge/models/models.dart';
import 'package:superformula_challenge/repositories/repositories.dart';

class QrBloc extends Cubit<QrState> {
  final QrRepository qrRepository;

  QrBloc({
    @required this.qrRepository,
  }) : super(SeedNotLoaded());

  Future getSeed() async {
    emit(SeedLoading());
    var result = await qrRepository.getSeed();
    if (result is Seed) {
      emit(SeedLoaded(seed: result));
    } else {
      emit(SeedNotLoaded());
    }
  }
}
