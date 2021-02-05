// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:qrGenerator/domain/models/seed_dto.dart';
import 'package:random_string/random_string.dart';

/// This file represents the entirety of the simple server that generates seeds for the app.
/// It simply handles GET requests, and generates a Seed object (seed and an attached expiration time)
/// for each GET request it receives.

const int stringLength = 10;
const seedDuration = Duration(seconds: 60);

Future main() async {
  // Binds to the local host on emulators. Note that this does not work so well for physical
  // devices.
  final server = await HttpServer.bind('localhost', 8000);

  print('Listening on http://${server.address.address}:${server.port}/');
  await for (var request in server) {
    handleRequest(request);
  }
}

/// Handle server requests
void handleRequest(HttpRequest request) {
  final reqPath = request.uri.path;
  try {
    if (request.method == 'GET' && reqPath == '/seed') {
      handleGet(request);
    } else {
      request.response
        ..statusCode = HttpStatus.methodNotAllowed
        ..write('Unsupported request: ${request.method}.')
        ..close();
    }
  } catch (e) {
    print('Exception in handleRequest: $e');
  }
  print('Request handled.');
}

/// Handle GET requests
void handleGet(HttpRequest request) {
  // Per request, generate and encode a seed w/ an expiration time
  var seedResponse = SeedDTO(_randomString(), _expiration());
  var map = seedResponse.toJson();
  var encoded = jsonEncode(map);
  print(encoded);

  // Bundle and send the response
  final response = request.response;
  response.statusCode = HttpStatus.ok;
  response.headers.contentType = new ContentType('application', 'json', charset: 'utf-8');
  response
    ..write(encoded)
    ..close();
}

/// Generate random fixed length string
String _randomString() {
  String str = randomAlpha(stringLength);
  return str;
}

/// Generate fixed time duration
DateTime _expiration() {
  var now = DateTime.now();
  var expiry = now.add(seedDuration);
  return expiry;
}
