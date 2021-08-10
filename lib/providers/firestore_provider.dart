import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class FirestoreProvider extends ChangeNotifier {
  bool? _confirmed;
  bool? get confirmed => _confirmed;

  FirestoreProvider() {
    FirebaseFirestore.instance;
  }

  Future<bool> confirmScan(Barcode result, BuildContext context) async {
    if (result.code == '') {
      _confirmed = false;
    } else {
      _confirmed = true;
      await FirebaseFirestore.instance
          .collection('completed')
          .add({'code': result.code, 'time': DateTime.now()});
    }
    notifyListeners();
    return Future.value(_confirmed);
  }

  Stream<QuerySnapshot> fetchHistory() {
    return FirebaseFirestore.instance.collection('completed').snapshots();
  }

  String formatDate(Timestamp time) {
    return DateFormat('yyyy-MM-dd –').add_jms().format(time.toDate());
  }
}
