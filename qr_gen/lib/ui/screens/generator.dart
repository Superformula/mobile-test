import 'package:flutter/material.dart';
import 'package:flutter_observable_state/flutter_observable_state.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_gen/core/locator.dart';
import 'package:qr_gen/core/qr.dart';

import '../widgets/expiry_panel.dart';

class GeneratorScreen extends StatefulWidget {
  @override
  _GeneratorScreenState createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends State<GeneratorScreen> {
  final _state = sl<QrState>();
  final _actions = sl<QrActions>();

  @override
  void initState() {
    super.initState();
    _actions.getSeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: observe(() {
          final loading = _state.loading;
          final isLoading = Set.from([LoadingState.Idle, LoadingState.Busy])
              .contains(loading);

          if (isLoading) return CircularProgressIndicator();

          if (loading == LoadingState.Failure)
            return Text('Something went horribly wrong');

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: _state.seed.encode(),
                version: QrVersions.auto,
                size: 200.0,
              ),
              SizedBox(height: 25),
              ExpiryPanel(
                seed: _state.seed,
                onRefresh: () => _actions.getSeed(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
