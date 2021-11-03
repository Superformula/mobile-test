import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:mobile_test/options.dart';
import 'package:mobile_test/dataClasses/seed_response.dart';

/// getSeed performs an HTTP request to the seed server and parses the response.
/// I have opted to use the HTTP classes included with dart instead of the http
/// package, because they provide the ability to abort the HTTP operation
/// natively. The http package requires a kludge.
Future<SeedResponse> getSeed() async {
  final uri = Uri.tryParse(Options.instance.baseUrl);

  if (uri == null) {
    throw Exception('URL is not parseable');
  }

  final HttpClient client;
  final HttpClientRequest request;
  final HttpClientResponse response;

  try {
    client = HttpClient();
    request = await client.getUrl(uri);
    response = await request.close();
  } catch (e) {
    throw Exception('Unable to connect to the server');
  }

  var completer = Completer<SeedResponse>();

  // Compile the body data as we receive chunks.
  var body = '';
  response.transform(utf8.decoder).listen(
    (event) {
      body += event;
    },
    onDone: () {
      SeedResponse seedResponse;
      try {
        seedResponse = SeedResponse.fromJsonString(body);
      } catch (e) {
        completer.completeError(e);
        return;
      }

      completer.complete(seedResponse);
    },
  );

  return completer.future;
}

/// validateSeed performs an HTTP Post operation to send the seed back. The app
/// expects a 200 response for a valid seed and anything else represents a
/// non-valid seed.
Future validateSeed(
  String seed,
) async {
  final uri = Uri.tryParse('${Options.instance.baseUrl}/validate');

  if (uri == null) {
    throw Exception('URL is not parseable');
  }

  final HttpClient client;
  final HttpClientRequest request;
  final HttpClientResponse response;

  try {
    client = HttpClient();
    request = await client.postUrl(uri);

    request.headers.contentType =
        ContentType("application", "json", charset: "utf-8");

    request.write(jsonEncode({
      'seed': seed,
    }));

    response = await request.close();
  } catch (e) {
    throw Exception('Unable to connect to the server');
  }

  var completer = Completer();

  response.listen(
    (event) {
      // Do nothing
    },
    onDone: () {
      // TODO Updated this code to differentiate between 400 (user error) and 500 (server error) response codes
      if (response.statusCode != 200) {
        completer.completeError(Exception('Invalid Seed'));
        return;
      }

      completer.complete();
    },
  );

  return completer.future;
}
