import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_generator/data/api/api.dart';
import 'package:qr_generator/data/qr_generator/repository/qr_generator_repo_impl.dart';
import 'package:qr_generator/domain/model/failure.dart';
import 'package:qr_generator/domain/model/qr_code.dart';
import 'package:http/http.dart' as http;
import 'package:qr_generator/domain/qr_generator/repository/qr_generator_repo.dart';
import '../mocks/mocker.dart';
import '../mocks/mocker.mocks.dart';

main() {
  group(
    '$QRGeneratorRepositoryImpl tests',
    () {
      late QRApi api;
      late QRGeneratorRepository repository;

      setUp(() {
        api = MockQRApi();
        repository = QRGeneratorRepositoryImpl(api);
      });

      test(
        'should return a valid QRCode when api returns a valid seed',
        () async {
          // arrange
          when(api.generateQR()).thenAnswer(
            (_) => Future<http.Response>.value(
              http.Response(
                jsonEncode(mockQRValidResponse),
                200,
              ),
            ),
          );

          // act
          final Either<Failure, QRCode> result =
              await repository.generateQRCode();

          // assert
          expect(result, isA<Right>());
        },
      );

      test(
        'should return a Failure instance when api call fails',
        () async {
          // arrange
          when(api.generateQR()).thenAnswer(
            (_) => Future<http.Response>.value(
              http.Response(
                '',
                400,
              ),
            ),
          );

          // act
          final Either<Failure, QRCode> result =
              await repository.generateQRCode();

          // assert
          expect(result, isA<Left>());
        },
      );
    },
  );
}
