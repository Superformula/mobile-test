import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_generator/domain/i_seed_generator_repository.dart';

part 'scan_page_state.dart';
part 'scan_page_cubit.freezed.dart';

@injectable
class ScanPageCubit extends Cubit<ScanPageState> {
  final ISeedGeneratorRepository _generatorRepository;
  ScanPageCubit(this._generatorRepository)
      : super(const ScanPageState.initial());

  Future<void> codeObtained(String code) async {
    emit(ScanPageState.seedScanned(code: code));
    final failureOrSuccess = await _generatorRepository.verifySeed(code);

    emit(
      failureOrSuccess.fold(
        (l) => const ScanPageState.seedInvalid(),
        (s) => ScanPageState.seedVerified(code: code),
      ),
    );
  }
}
