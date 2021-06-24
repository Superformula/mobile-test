import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:qr_generator/domain/failures/common_failure.dart';
import 'package:qr_generator/infrastructure/dtos/seed_dto.dart';
import 'package:qr_generator/domain/i_seed_generator_repository.dart';
import 'package:qr_generator/domain/seed.dart';
import 'package:qr_generator/infrastructure/extensions/dio_extensions.dart';

@LazySingleton(as: ISeedGeneratorRepository)
class SeedGeneratorRepository implements ISeedGeneratorRepository {
  final SharedPreferences _sharedPreferences;
  final Dio _dio;

  static final endpoint = Uri.parse('http://mtask.mx/seed');
  static const cacheKey = "seed";

  SeedGeneratorRepository(
    this._sharedPreferences,
    this._dio,
  );

  @override
  Future<Either<CommonFailure, Seed>> fetchSeed() async {
    try {
      final response = await _dio.getUri(endpoint);
      final seed = _dataToSeed(response.data);
      if (seed == null) {
        return left(const CommonFailure.unknown());
      }
      _sharedPreferences.setString(cacheKey, json.encode(seed.toJson()));
      return right(seed.toDomain());
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return _fetchSeedFromCache();
      }
      return left(const CommonFailure.unknown());
    }
  }

  @override
  Future<Either<CommonFailure, Unit>> verifySeed(String seed) async {
    // and how it could be validated with another endpoint.
    return Future.delayed(const Duration(seconds: 3), () => right(unit));
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
    return right(seed.toDomain());
  }

  SeedDto? _dataToSeed(dynamic data) {
    if (data is! Map) {
      return null;
    }
    return SeedDto.fromJson(Map<String, dynamic>.from(data));
  }
}
