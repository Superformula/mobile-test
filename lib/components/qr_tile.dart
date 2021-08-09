import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrdemo/providers/firestore_provider.dart';
import 'package:qrdemo/styles/textstyles.dart';

class QRTile extends StatelessWidget {
  const QRTile({Key? key, this.code, this.time}) : super(key: key);

  final String? code;
  final Timestamp? time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$code', style: subheading),
        Text(
            Provider.of<FirestoreProvider>(context, listen: false)
                .formatDate(time!),
            style: regular),
      ],
    );
  }
}
