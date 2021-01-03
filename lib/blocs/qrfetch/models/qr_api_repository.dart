import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';

/// Fetches the seed for the QR code from an HTTP endpoint
abstract class QRRepository extends Equatable {
  const QRRepository();

  /// Fetches data from a specific data source.
  Future<Seed> getData({
    @required Dio dio
  });

  @override
  List<Object> get props => [];
}