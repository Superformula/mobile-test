import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qr_lib/qr_controller.dart';
import 'package:flutter_qr_lib/qr_view.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/blocs/seed_bloc.dart';
import 'package:qr_app/models/seed_data.dart';

class QRCode extends StatefulWidget {
  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  StreamSubscription<SeedData> _subscription;
  String _seed;
  bool _isLoading = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bloc = Provider.of<SeedBloc>(context, listen: false);
    _subscription = bloc.seedData.listen((data) {
      if (!mounted) return;
      if (data == null)
        setState(() {
          _isLoading = true;
        });
      else
        setState(() {
          _isLoading = false;
          _seed = data.seed;
        });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 1,
        ),
        Container(
          height: 300,
          width: 300,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1.0, color: Colors.grey),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                color: Colors.grey[300],
              ),
            ],
          ),
          child: _isLoading
              ? CircularProgressIndicator()
              : QRView(
                  onControllerCreated: (QRController controller) =>
                      controller.loadSeed(_seed),
                ),
        ),
        Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
