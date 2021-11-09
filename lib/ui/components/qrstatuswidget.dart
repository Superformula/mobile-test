import 'package:flutter/material.dart';
import 'package:qrapp/models/seed.dart';
import 'package:qrapp/models/seedstatus.dart';
import 'package:intl/intl.dart';

class QRStatusWidget extends StatefulWidget {
  SeedStatus status;
  SeedModel? seed;
  QRStatusWidget({Key? key, required this.status, required this.seed})
      : super(key: key);

  @override
  _QRStatusWidgetState createState() => _QRStatusWidgetState();
}

class _QRStatusWidgetState extends State<QRStatusWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.status == SeedStatus.VERIFIED && widget.seed != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.verified,
            size: 55,
            color: Colors.blue,
          ),
          const SizedBox(height: 5),
          const Text(
            "Verified Seed",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          ListTile(
            title: const Text("Seed"),
            trailing: Text(widget.seed!.seed),
          ),
          ListTile(
            title: const Text("Expires"),
            trailing: Text(
                DateFormat('yyyy-MM-dd kk:mm').format(widget.seed!.expiresAt)),
          ),
        ],
      );
    }

    if (widget.status == SeedStatus.OUTDATEDED && widget.seed != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 55,
            color: Colors.red,
          ),
          const SizedBox(height: 5),
          const Text(
            "Expired Seed",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          ListTile(
            title: const Text("Seed"),
            trailing: Text(widget.seed!.seed),
          ),
          ListTile(
            title: const Text("Expired"),
            trailing: Text(
                DateFormat('yyyy-MM-dd kk:mm').format(widget.seed!.expiresAt)),
          ),
        ],
      );
    }

    if (widget.status == SeedStatus.ERROR || widget.seed != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.error,
            size: 55,
            color: Colors.red,
          ),
          SizedBox(height: 5),
          Text(
            "Error scanning seed",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      );
    }

    return Text(widget.status.toString());
  }
}
