import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/qr_code_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('JSON to QRCodeData', () async {

    var dateTimeStr = "2021-01-10T23:52:55.281Z";
    var expiresAt = DateTime.parse(dateTimeStr);

    var base64Str = "iVBORw0KGgoAAAANSUhEUgAAAHQAAAB0CAYAAABUmhYnAAAAAklEQVR4AewaftIAAAKmSURBVO3BQW7sWAwEwUxC979yjZdcPUCQuu3hZ4T5wRqjWKMUa5RijVKsUYo1SrFGKdYoxRqlWKMUa5RijVKsUYo1SrFGKdYoFw+pfFMSTlROktCpdEnoVL4pCU8Ua5RijVKsUS5eloQ3qTyRhDcl4U0qbyrWKMUapVijXHyYyh1JuEPlDpU3qdyRhE8q1ijFGqVYo1wMp/IvKdYoxRqlWKNcDJOETqVLQqcySbFGKdYoxRrl4sOS8E0qJypdEp5Iwl9SrFGKNUqxRrl4mcpvSkKn0iWhU+mScKLylxVrlGKNUqxRzA/+x1ROkvAvKdYoxRqlWKNcPKTSJaFTeVMSuiR0KicqXRJOVN6UhE8q1ijFGqVYo1y8TOUkCZ1Kl4QTlZMk3KFyRxJOVLoknKh0SXiiWKMUa5RijWJ+8IBKl4RO5ZuScIdKl4RO5SQJJyonSXhTsUYp1ijFGuXioSR0KnckoVPpknCicofKicpJEk5UflOxRinWKMUa5eJlSThROUlCp9Il4Q6VLgmdSpeEE5UuCV0SflOxRinWKMUa5eLLknBHEu5Q6ZLwl6l0SXiiWKMUa5RijWJ+8IDKNyXhROWOJHQqXRJOVJ5IwpuKNUqxRinWKBcvS8KbVE5UTpJwRxJOVP6yYo1SrFGKNcrFh6nckYQ3qZwkoVPpktAloVPpknCi8knFGqVYoxRrlIthktCpnKicqJwk4USlS8InFWuUYo1SrFEuhkvCiUqXhE7lDpUuCd9UrFGKNUqxRrn4sCR8UhI6lS4JncqJykkS7lDpkvBJxRqlWKMUa5SLl6l8k8odSehUuiQ8kYQTlS4JbyrWKMUapVijmB+sMYo1SrFGKdYoxRqlWKMUa5RijVKsUYo1SrFGKdYoxRqlWKMUa5RijfIfEZD49PAy8D8AAAAASUVORK5CYII=";
    var seed = Base64Decoder().convert(base64Str);

    var jsonResponse = {
      "expires_at": dateTimeStr,
      "seed": base64Str
    };

    var data = QRCodeData.fromJson(jsonResponse);

    expect(data.expiresAt == expiresAt, true);
    expect(listEquals(data.seed, seed), true);
  });
}
