import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_generator/domain/model/failure.dart';
import 'package:qr_generator/domain/model/qr_code.dart';
import 'package:qr_generator/domain/qr_generator/repository/qr_generator_repo.dart';

part 'generator_state.dart';

class GeneratorCubit extends Cubit<GeneratorState> {
  GeneratorCubit(this.repository) : super(GeneratorInitial());

  final QRGeneratorRepository repository;

  void generateQR() async {
    if (state is GeneratorError) {
      emit(GeneratorInitial());
    }
    Either<Failure, QRCode> result = await repository.generateQRCode();

    result.fold(
      (Failure failure) => emit(
        GeneratorError(errorMessage: failure.errorMessage),
      ),
      (QRCode qrCode) {
        int secondsToExpire =
            qrCode.expirationDate.difference(DateTime.now()).inSeconds;
        _emitQRandExpiration(qrCode.data, secondsToExpire);
      },
    );
  }

  void _emitQRandExpiration(String data, int secondsToExpire) async {
    // Shouldn't emit states when screen is closed
    if (!this.isClosed) {
      print('emitting');
      emit(GeneratedQR(qrData: data, secondsToExpire: secondsToExpire));
      await Future.delayed(Duration(seconds: 1));
      if (secondsToExpire > 1) {
        _emitQRandExpiration(data, secondsToExpire - 1);
      } else {
        emit(GeneratedQR(qrData: data, secondsToExpire: 0));
        generateQR();
      }
    }
  }
}
