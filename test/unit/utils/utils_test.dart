import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_test/core/utilities.dart';

void main() async {
  test('Utilities Decode test', () async {
    final base64Strings = <String>[
      "SGVsbG9Xb3JsZA==",
      "U3VwZXJmb3JtdWxh",
      "TW9ua2V5IEQgTHVmZnk=",
      "UGx1cyBVbHRyYQ==",
    ];

    final decodedString1 = Utils.decodeString(base64Strings[0]);
    final decodedString2 = Utils.decodeString(base64Strings[1]);
    final decodedString3 = Utils.decodeString(base64Strings[2]);
    final decodedString4 = Utils.decodeString(base64Strings[3]);

    expect(decodedString1, 'HelloWorld');
    expect(decodedString2, 'Superformula');
    expect(decodedString3, 'Monkey D Luffy');
    expect(decodedString4, 'Plus Ultra');
  });
}
