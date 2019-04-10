import 'package:qrcode/env/env.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qrcode/model/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:io';

///
/// Manager to contain the information to communicating with the backend server
///
abstract class BackendMgr extends Manager {
  ///
  /// Fetch the seed from the backend server
  ///
  Future<Seed> fetchSeed();

  ///
  /// Determines if the passed in seed matches the last retrieved seed
  ///
  Future<bool> confirmLatestSeed(String seed);

  ///
  /// Determines if the backend can be reached
  ///
  Future<bool> isConnected();
}

///
/// BackendMgr which utilizes Firebase
///
class FirebaseBackendMgr extends BackendMgr {

  static const URL_FETCH_SEED = 'https://us-central1-superformulaqrcode.cloudfunctions.net/fetchSeed';
  static const FIELD_SEED = "seed";
  static const FIELD_EXPIRES_AT = "expires_at";

  static const QRCODE_DATA_PATH = "data/qrcode";
  static const FIELD_LATEST_SEED = "latest_seed";

  Future<bool> isConnected() async {
    try {
      print("checking connection");
      final result = await InternetAddress.lookup("google.com");

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print("conntected!");
        return Future.value(true);
      } else {
        print("NOT conntected!");
        return Future.value(false);
      }
    } on SocketException catch (_) {
      print("unable to connect to backend");
      return Future.value(false);
    }
  }

  @override
  Future<Seed> fetchSeed() async {
    if (await isConnected()) {
      var response = await http.get(URL_FETCH_SEED);

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        var seed = jsonResponse[FIELD_SEED];
        var expiresAt = jsonResponse[FIELD_EXPIRES_AT];
        print("seed $seed expiresAt $expiresAt");
        return Seed.success(seed, expiresAt);
      } else {
        print("Request failed with status: ${response.statusCode}.");
        return Seed.failure();
      }
    } else {
      print("oops");
      return Seed.failure();
    }
  }

  @override
  Future<bool> confirmLatestSeed(String seed) async {

    DocumentSnapshot docSnapshot = await Firestore.instance.document(QRCODE_DATA_PATH).get();
    if (docSnapshot.exists) {
      return Future.value(docSnapshot.data["latest_seed"] == seed);
    } else {
      return Future.value(false);
    }
  }
}

//class DevBackendMgr extends BackendMgr {
//  @override
//  Future<bool> confirmLatestSeed(String seed) {
//    // TODO: implement confirmLatestSeed
//    return null;
//  }
//
//  @override
//  Future<Seed> fetchSeed() {
//    // TODO: implement fetchSeed
//    return null;
//  }
//
//  @override
//  Future<bool> isConnected() {
//    // TODO: implement isConnected
//    return null;
//  }
//
//}