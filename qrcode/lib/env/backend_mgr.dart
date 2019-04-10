import 'dart:async';
import 'package:qrcode/env/env.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qrcode/model/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:connectivity/connectivity.dart';

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

    print("checking connection");
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("NOT conntected!");
      return Future.value(false);
    } else {
      print("conntected!");
      return Future.value(true);
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
      print("Request failed, not connected to backend");
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