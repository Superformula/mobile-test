import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:qr_generator/qr_generator.dart';
import 'qr_generator_state.dart';

///Cubit State Hanlder
class QrGeneratorCubit extends Cubit<QrGeneratorState> {
  ///Create an instace of `Cubit` with [QrGeneratorState]
  QrGeneratorCubit({
    @required GetSeed getSeed,
  })  : assert(getSeed != null),
        _getSeed = getSeed,
        super(const Initial());

  final GetSeed _getSeed;

  ///Get seed from api
  Future<void> getSeed() async {
    emit(const Loading());
    final failureOrSeed = await _getSeed();

    failureOrSeed.fold(
      (l) => emit(const Error()),
      (r) => emit(Data(seed: r)),
    );
  }

  ///Expire the QrCode
  void expireCode() {
    emit(const Expired());
  }
}
