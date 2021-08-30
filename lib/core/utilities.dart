import 'dart:convert';

///Used to decode a string from a Base64 offset.
class Utils {
  static String decodeString(String? value) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    if (value != null) {
      return stringToBase64.decode(value);
    }
    return '';
  }
}
