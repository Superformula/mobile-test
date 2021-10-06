import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan/scan.dart';

import '../../../generated/l10n.dart';
import '../../design_tokens/dimensions.dart';
import '../../routes/scan_seed/scan_seed_page_bloc.dart';

class ScanSeedPage extends StatelessWidget {
  const ScanSeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).scanPageTitle),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: Dimensions.regular),
            const _CameraView(),
            const SizedBox(height: Dimensions.regular),
            _validationLabel(),
          ],
        ),
      ),
    );
  }

  Widget _validationLabel() => Consumer<ScanSeedPageBloc>(
        builder: (BuildContext context, ScanSeedPageBloc bloc, __) {
          return StreamBuilder<bool>(
            stream: bloc.observeSeedValidation(),
            builder: (_, AsyncSnapshot<bool> snapshot) {
              if (snapshot.data != null) {
                return snapshot.data!
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.error,
                        color: Theme.of(context).errorColor,
                      );
              }
              return const SizedBox();
            },
          );
        },
      );
}

class _CameraView extends StatefulWidget {
  const _CameraView({Key? key}) : super(key: key);

  @override
  State<_CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<_CameraView> {
  late ScanController _scanController;

  @override
  void initState() {
    _scanController = ScanController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: LayoutBuilder(
        builder: (_, BoxConstraints constraints) {
          return SizedBox(
            width: constraints.maxWidth * 0.7,
            height: constraints.maxWidth * 0.7,
            child: Consumer<ScanSeedPageBloc>(
              builder: (_, ScanSeedPageBloc bloc, __) => ScanView(
                controller: _scanController,
                onCapture: (String data) {
                  bloc.validateSeed(data);
                  _scanController.resume();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
