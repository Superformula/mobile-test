import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrdemo/providers/firestore_provider.dart';
import 'package:qrdemo/styles/textstyles.dart';

class QRTile extends StatefulWidget {
  const QRTile({Key? key, this.code, this.time}) : super(key: key);

  final String? code;
  final Timestamp? time;

  @override
  _QRTileState createState() => _QRTileState();
}

class _QRTileState extends State<QRTile> {
  String? formattedTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${widget.code}', style: subheading),
        Text(formattedTime!, style: regular),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    formattedTime = Provider.of<FirestoreProvider>(context, listen: false)
        .formatDate(widget.time!);
  }
}
