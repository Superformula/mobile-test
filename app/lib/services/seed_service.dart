import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:supercode/models.dart';

abstract class SeedService {
  Future<Seed> fetchSeed();
  Future<bool> validateCode(String data);
}

class SeedServiceImpl implements SeedService {
  http.Client _client;
  String _host;

  SeedServiceImpl({@required String host, http.Client client}) {
    _host = host;
    _client = client ?? http.Client();
  }

  /// Fetches a [Seed] from the server
  @override
  Future<Seed> fetchSeed() async {
    final response =
        await _client.get('$_host/seed').timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      return Seed.fromJson(json.decode(response.body));
    } else {
      throw new Exception("Error fetching seed");
    }
  }

  /// Determines if [data] is a valid QR code and has not expired
  @override
  Future<bool> validateCode(String data) async {
    final response = await _client
        .get('$_host/validate?code=$data')
        .timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      Map<String, dynamic> rawJson = json.decode(response.body);
      return rawJson['is_valid'];
    } else {
      throw new Exception('Error validating code');
    }
  }
}
