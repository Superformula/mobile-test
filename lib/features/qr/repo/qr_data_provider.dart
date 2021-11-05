import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:sf_qr_code/features/qr/models/seed_response.dart';

class QrDataProvider {
  Future<SeedResponse> fetchQRSeedData() async {
    // commented out the real http call since I dont have a end-point for now

    // final response = await http
    //     .get(Uri.parse('https://sample-end-point/qrcode/seed'));

    // if (response.statusCode == 200) {
    //   return SeedResponse.fromJson(response.body);
    // } else {
    //   return SeedResponse.fromException();
    // }
    final mockResponse = getMockSeedResponse(); // using the mock data for dev purpose
    return SeedResponse.fromMap(mockResponse);
  }

  Map<String, dynamic> getMockSeedResponse() {
    Map<String, dynamic> mockResponse = {
      "seed": generateRandomString(20),
      "expiresAt": generateExpiryAt()
    };
    return mockResponse;
  }

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  String generateRandomString(int length) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  String generateExpiryAt() {
    final today = new DateTime.now();
    final timerAddedList = [20, 30, 15, 11];
    
    var expiryAtTimeStamp = today.add(new Duration(seconds: timerAddedList[_rnd.nextInt(timerAddedList.length)]));
    return expiryAtTimeStamp.toString();
  }
}
