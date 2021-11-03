import 'dart:convert';

/// The SeedResponse class represents the data from a response from the seed
/// server. It accepts input for deserialization. The factory constructors will
/// not pass empty or default versions of the class. Rather, they throw
/// expcetions if the data passed in are invalid.
class SeedResponse {
  final String seed;
  final DateTime expiration;

  SeedResponse({
    required this.seed,
    required this.expiration,
  });

  /// fromJsonString parses all values from the JSON data object passed in and
  /// attempts to create a SeedResponse object. A couplt things to note:
  /// This constructor throws exceptions if the data is invalid.
  /// I didn't use a generator because the Flutter page itself states:
  /// 'Use manual serialization for smaller projects'
  /// https://flutter.dev/docs/development/data-and-backend/json
  factory SeedResponse.fromJsonString(String jsonStr) {
    var rawJson = jsonDecode(jsonStr);

    const errMsg = 'Invalid JSON received from server';
    if (rawJson is! Map) {
      throw Exception(errMsg);
    }

    if (rawJson['seed'] is! String || rawJson['expires_at'] is! String) {
      throw Exception(errMsg);
    }

    DateTime exp;
    try {
      exp = DateTime.parse(rawJson['expires_at']);
    } catch (e) {
      throw Exception(errMsg);
    }

    return SeedResponse(seed: rawJson['seed'], expiration: exp);
  }
}
