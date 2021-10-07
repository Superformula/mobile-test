import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_generator/data/utils/network_checker.dart';
import 'package:qr_generator/domain/model/failure.dart';
import 'package:qr_generator/domain/model/qr_code.dart';
import 'package:qr_generator/domain/qr_generator/repository/qr_generator_repo.dart';

part 'generator_state.dart';

class GeneratorCubit extends Cubit<GeneratorState> {
  GeneratorCubit(this._repository) : super(GeneratorLoading());

  final QRGeneratorRepository _repository;
  late AppLifecycleState _lifecycleState;

  void setLifeCycleEvent(AppLifecycleState lifecycleState) {
    _lifecycleState = lifecycleState;
  }

  void generateQR() async {
    bool isConnected = await isConnectedToNetwork();

    if (_lifecycleState == AppLifecycleState.resumed) {
      emit(GeneratorLoading());

      if (!isConnected) {
        emit(
          GeneratorError(errorMessage: 'No network available.'),
        );
      } else {
        Either<Failure, QrCode> result = await _repository.generateQRCode();

        result.fold(
          (Failure failure) => emit(
            GeneratorError(errorMessage: failure.errorMessage),
          ),
          (QrCode qrCode) {
            int secondsToExpire =
                qrCode.expirationDate.difference(DateTime.now()).inSeconds;
            _emitQRandExpiration(qrCode.data, secondsToExpire);
          },
        );
      }
    }
  }

  void _emitQRandExpiration(String data, int secondsToExpire) async {
    if (_lifecycleState == AppLifecycleState.resumed) {
      emit(GeneratedQR(qrData: data, secondsToExpire: secondsToExpire));
      await Future.delayed(Duration(seconds: 1));
      if (secondsToExpire > 1) {
        _emitQRandExpiration(data, secondsToExpire - 1);
      } else if (secondsToExpire == 1) {
        emit(GeneratedQR(qrData: data, secondsToExpire: 0));
        generateQR();
      } else {
        // Shouldn't get to this, ever.
        emit(
          GeneratorError(errorMessage: 'Something went wrong, try again later'),
        );
      }
    }
  }
}
