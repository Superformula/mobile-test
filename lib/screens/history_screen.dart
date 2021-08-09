import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrdemo/components/qr_tile.dart';
import 'package:qrdemo/providers/firestore_provider.dart';
import 'package:qrdemo/styles/textstyles.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          Provider.of<FirestoreProvider>(context, listen: false).fetchHistory(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: Container(
              margin: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text('History', style: heading),
                    for (var qr in snapshot.data!.docs)
                      QRTile(code: qr['code'], time: qr['time'])
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
              body:
                  Container(child: Center(child: CircularProgressIndicator())));
        }
      },
    );
  }
}
