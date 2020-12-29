import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile_test_app/repository/qr_repository.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  final QrRepository _repository;

  ScanCubit({
    @required QrRepository repository,
  })  : _repository = repository,
        super(ScanInitial());

  Future<void> validateCode(String code) async {
    emit(CodeValidatingState());
    final result = await _repository.validate(code);
    if (result) {
      emit(CodeValidState());
    } else {
      emit(CodeInvalidState());
    }
  }

  void reset() {
    emit(ScanInitial());
  }
}
