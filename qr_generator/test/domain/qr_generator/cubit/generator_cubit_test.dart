import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_generator/domain/model/failure.dart';
import 'package:qr_generator/domain/model/qr_code.dart';
import 'package:qr_generator/domain/qr_generator/cubit/generator_cubit.dart';
import 'package:qr_generator/domain/qr_generator/repository/qr_generator_repo.dart';

import '../mocks/mocker.mocks.dart';

void main() {
  group('$GeneratorCubit tests', () {
    late GeneratorCubit cubit;
    late QRGeneratorRepository repository;

    setUp(() {
      repository = MockQRGeneratorRepository();
      cubit = GeneratorCubit(repository);

      cubit.setLifeCycleEvent(AppLifecycleState.resumed);
    });

    blocTest<GeneratorCubit, GeneratorState>(
      'GenerateQR function emits a QR when repo works as expected',
      build: () {
        when(repository.generateQRCode()).thenAnswer(
          (_) async => Right(
            QRCode(
              "hello",
              DateTime.now().add(
                const Duration(seconds: 30),
              ),
            ),
          ),
        );
        return cubit;
      },
      act: (GeneratorCubit cubit) => cubit.generateQR(),
      expect: () => [isA<GeneratedQR>()],
    );

    blocTest<GeneratorCubit, GeneratorState>(
      'GenerateQR function emits an error when repo fails',
      build: () {
        when(repository.generateQRCode()).thenAnswer(
          (_) async => Left(
            Failure("Some error"),
          ),
        );
        return cubit;
      },
      act: (GeneratorCubit cubit) => cubit.generateQR(),
      expect: () => [isA<GeneratorError>()],
    );

    tearDown(() {
      cubit.close();
    });
  });
}
