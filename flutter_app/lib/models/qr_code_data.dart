import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class QRCodeData {
  final Uint8List seed;
  final DateTime expiresAt;

  QRCodeData({ @required this.seed, @required this.expiresAt });

  factory QRCodeData.fromJson(Map<String, dynamic> json) {
    try {
      final data = QRCodeData(
          seed: json['seed'] != null
              ? Base64Decoder().convert(json['seed'])
              : [],
          expiresAt: json['expires_at'] != null
              ? DateTime.parse(json['expires_at'])
              : DateTime.now().add(Duration(seconds: 15))
      );
      return data;
    } catch(e) {
      throw e;
    }
  }

}