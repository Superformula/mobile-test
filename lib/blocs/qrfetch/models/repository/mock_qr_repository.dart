import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';

/// A fake HTTP repository that returns a mock [Seed] object
class MockQRRepository extends QRRepository {
  /// The generated seed
  final String seed;
  /// When the seed expires
  final String expiryDate;

  /// Requires a fake [seed] and a fake expiry date [expiryDate]
  const MockQRRepository({
    @required this.seed,
    @required this.expiryDate
  });

  @override
  Future<Seed> getData({@required Dio dio}) async {
    // Fake waiting time...
    await Future.delayed(const Duration(seconds: 1));

    return Seed.fromJson({
      'seed': seed,
      'expires_at': expiryDate,
    });
  }
}