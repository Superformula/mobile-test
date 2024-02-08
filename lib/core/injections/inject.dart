import 'package:get_it/get_it.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/datasources/get_qr_code/get_qr_code_datasource.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/datasources/get_qr_code/get_qr_code_datasource_impl.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/repositories/get_qr_code_repository_impl.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/repositories/get_qr_code_repository.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/usecases/get_qr_code/get_qr_code_usecase.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/usecases/get_qr_code/get_qr_code_usecase_impl.dart';

sealed class Inject {
  static void init(GetIt getIt) {
    getIt.registerFactory<GetQrCodeDatasource>(
      GetQrCodeDatasourceImpl.new,
    );
    getIt.registerFactory<GetQrCodeRepository>(
      () => GetQrCodeRepositoryImpl(
        getQrCodeDatasource: getIt.get<GetQrCodeDatasource>(),
      ),
    );
    getIt.registerFactory<GetQrCodeUsecase>(
      () => GetQrCodeUsecaseImpl(
        getQrCodeRepository: getIt.get<GetQrCodeRepository>(),
      ),
    );
  }
}
