import 'package:qrcode/env/env.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RemoteStorageMgr extends Manager {
  Future<String> getSeed();
}

class FirebaseRemoteStorageMgr extends RemoteStorageMgr {

  @override
  Future<String> getSeed() async {
    DocumentSnapshot docSnapshot = await Firestore.instance.document('data/qrcode').get();
    if (docSnapshot.exists) {
      return Future.value(docSnapshot.data["seed"].toString());
    } else {
      return Future.value("ERROR");
    }

  }

}