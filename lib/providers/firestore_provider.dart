import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrdemo/providers/qr_provider.dart';
import 'package:qrdemo/providers/routing_provider.dart';
import 'package:qrdemo/providers/timer_provider.dart';
import 'package:qrdemo/styles/textstyles.dart';

class FirestoreProvider extends ChangeNotifier {
  List<String>? _codes = [];
  List<String>? get codes => _codes;

  FirestoreProvider() {
    FirebaseFirestore.instance;
  }

  void confirmScan(Barcode result, BuildContext context) {
    if (result.code == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'QR Expired!',
              ),
              TextButton(
                child: Text('Get a code', style: snackbar),
                onPressed: () async {
                  Provider.of<TimerProvider>(context, listen: false).reset();
                  Provider.of<TimerProvider>(context, listen: false)
                      .cancelTimer();
                  Provider.of<QRProvider>(context, listen: false)
                      .generateCode();
                  Provider.of<RoutingProvider>(context, listen: false)
                      .goToQRScreen(context);
                },
              ),
            ],
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Code Scanned!'),
          TextButton(
            child: Text('See history', style: snackbar),
            onPressed: () async {
              Provider.of<RoutingProvider>(context, listen: false)
                  .goToHistoryScreen(context);
            },
          ),
        ],
      )));
      FirebaseFirestore.instance
          .collection('completed')
          .add({'code': result.code, 'time': DateTime.now()});
    }
    notifyListeners();
  }

  Stream<QuerySnapshot> fetchHistory() {
    return FirebaseFirestore.instance.collection('completed').snapshots();
  }

  String formatDate(Timestamp time) {
    return DateFormat('yyyy-MM-dd –').add_jms().format(time.toDate());
  }
}
