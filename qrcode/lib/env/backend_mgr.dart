import 'package:qrcode/env/env.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qrcode/model/model.dart';

abstract class BackendMgr extends Manager {
  Future<Seed> fetchSeed();
}

class FirebaseBackendMgr extends BackendMgr {

  static const FIELD_SEED = "seed";
  static const FIELD_EXPIRES_AT = "expires_at";

  @override
  Future<Seed> fetchSeed() async {

    var url = 'https://us-central1-superformulaqrcode.cloudfunctions.net/fetchSeed';
    var response = await http.get(url);

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


//    DocumentSnapshot docSnapshot = await Firestore.instance.document('data/qrcode').get();
//    if (docSnapshot.exists) {
//      return Future.value(docSnapshot.data["seed"].toString());
//    } else {
//      return Future.value("ERROR");
//    }

  }

}