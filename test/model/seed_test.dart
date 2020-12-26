import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_challenge/models/models.dart';

void main() async {
  test('Successfully parse Seed from JSON', () async {
    Map json = {
      "_id": '24bc3',
      "seed": "foo",
      "expires_at": "2020-12-26T20:14:47.410Z",
    };
    Seed seed = Seed.fromJson(json);

    expect(seed.id, json['_id']);
    expect(seed.seed, json['seed']);
    expect(seed.expiresAt, DateTime.parse(json['expires_at']));
  });
}
