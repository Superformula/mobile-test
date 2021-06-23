import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:qr_generator/domain/failures/common_failure.dart';
import 'package:qr_generator/infrastructure/dtos/seed_dto.dart';
import 'package:qr_generator/domain/i_seed_generator_repository.dart';
import 'package:qr_generator/domain/seed.dart';
import 'package:qr_generator/infrastructure/extensions/dio_extensions.dart';

class SeedGeneratorRepository implements ISeedGeneratorRepository {
  final SharedPreferences _sharedPreferences;
  final Dio _dio;

  static final endpoint = Uri.parse('localhost:3000/seed');
  static const cacheKey = "seed";

  SeedGeneratorRepository(
    this._sharedPreferences,
    this._dio,
  );

  Future<Either<CommonFailure, Seed>> fetchSeed() async {
    try {
      final response = await _dio.getUri(endpoint);
      final seed = _dataToSeed(response.data);
      if (seed == null) {
        return left(const CommonFailure.unknown());
      }

      return right(seed);
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return left(const CommonFailure.unknown());
      }
      return _fetchSeedFromCache();
    }
  }

  Either<CommonFailure, Seed> _fetchSeedFromCache() {
    final string = _sharedPreferences.getString(cacheKey);
    if (string == null) {
      return left(const CommonFailure.noInternet());
    }

    final seed = _dataToSeed(json.decode(string));
    if (seed == null) {
      return left(const CommonFailure.noInternet());
    }
    return right(seed);
  }

  Seed? _dataToSeed(dynamic data) {
    if (data is! Map) {
      return null;
    }
    return SeedDto.fromJson(Map<String, dynamic>.from(data)).toDomain();
  }
}
