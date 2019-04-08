import 'package:qrcode/env/env.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qrcode/model/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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

  @override
  Future<Seed> fetchSeed() async {
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
  }

  @override
  Future<bool> confirmLatestSeed(String seed) async {

    DocumentSnapshot docSnapshot = await Firestore.instance.document(QRCODE_DATA_PATH).get();
    if (docSnapshot.exists) {
      return Future.value(docSnapshot.data["latest_seed"]);
    } else {
      return Future.value(false);
    }
  }
}