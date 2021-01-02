import 'dart:convert';
import 'dart:io';

import 'dart:math';

/// Creation of a very simple HTTP server that listens on port 8075 and only
/// accepts GET requests.
void main() async {
  // HTTP server (HTTPs would simply require 'bindSecure()' rather than 'bind()')
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4, 8075
  );

  // Listening for new requests
  await for (final request in server) {
    // Handling requests
    if (request.method == "GET") {
      // A very simple way to quickly stop the server
      if (request.uri.path == "/stop") {
        await request.response.close();
        await server.close();
      } else {
        handleGet(request);
      }
    } else {
      request.response
          ..statusCode = HttpStatus.methodNotAllowed
          ..write("${request.method} is not handled by this server.");

      await request.response.close();
    }
  }
}

/// Handles GET requests coming from clients
void handleGet(HttpRequest request) async {
  if (request.uri.path == "/seed") {
    // Getting seed and time
    final seed = generateSeed();
    final expiry = DateTime.now().add(const Duration(seconds: 10));

    // Generating the JSON response
    final jsonData = {
      'seed': seed,
      'expires_at': expiry.toIso8601String()
    };

    request.response
      ..statusCode = 200
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(jsonData));
  } else {
    // No handlers for this endpoint!
    request.response
      ..statusCode = 200
      ..write("This endpoint is not handled.");
  }

  // Returning the response to the client
  await request.response.close();
}

/// Returns a random alphanumeric sequence of characters
String generateSeed() {
  final buffer = StringBuffer();
  final random = Random();

  // Generating random values
  for (var i = 0; i < 32; ++i) {
    buffer.write(random.nextInt(10));
  }

  // A buffer is more efficient than string concatenation
  return buffer.toString();
}