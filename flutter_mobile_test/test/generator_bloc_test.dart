import 'package:dio/dio.dart';
import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/models/qr_code_model.dart';
import 'package:flutter_mobile_test/pages/generator/generator_bloc.dart';
import 'package:flutter_mobile_test/repository/qr_code_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  QrCodeMockRepository repository;

  setUp(() {
    repository = QrCodeMockRepository();
    locator.registerLazySingleton<QrCodeRepository>(() => repository);

    when(repository.qrCodeObservable).thenAnswer((_) => Observable.just(
        QrCode('01170115cb7bbafb71c39201b09eaa6d31f24102', 20)));
  });

  test('Repository returns success', () {
    final bloc = GeneratorBloc();

    expectLater(bloc.qrCodeSeedObservable,
        emitsThrough('01170115cb7bbafb71c39201b09eaa6d31f24102'));
  });

  test('Test repository returns error', () {
    when(repository.qrCodeObservable)
        .thenAnswer((_) => Observable.error(DioError()));
    final bloc = GeneratorBloc();

    expectLater(bloc.qrCodeSeedObservable, emitsThrough(''));
  });

  tearDown(() {
    locator.reset();
  });
}

class QrCodeMockRepository extends Mock implements QrCodeRepository {}
