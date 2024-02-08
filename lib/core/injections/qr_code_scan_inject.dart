import 'package:dio/dio.dart';
import 'package:superformula_leandro/core/injections/instances/get_it_instance.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/datasources/get_qr_code/get_qr_code_datasource.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/datasources/get_qr_code/get_qr_code_datasource_impl.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/repositories/get_qr_code_repository_impl.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/repositories/get_qr_code_repository.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/usecases/get_qr_code/get_qr_code_usecase.dart';
import 'package:superformula_leandro/features/qr_code_scan/domain/usecases/get_qr_code/get_qr_code_usecase_impl.dart';

sealed class QrCodeScanInject {
  static void inject() {
    getIt.registerFactory<GetQrCodeDatasource>(
      () => GetQrCodeDatasourceImpl(dio: getIt.get<Dio>()),
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
