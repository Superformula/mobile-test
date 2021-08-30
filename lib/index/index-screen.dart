import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_generator/index/action-button.dart';
import 'package:qr_generator/index/expandable-fab.dart';
import 'package:qr_generator/index/index-bloc.dart';
import 'package:qr_generator/permissions/permission-wrapper.dart';
import 'package:qr_generator/providers/bloc-provider.dart';

class IndexScreen extends StatefulWidget {

  final PermissionWrapper permissionWrapper;

  IndexScreen({
    Key? key,
    required this.permissionWrapper
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {

  late IndexBloc bloc;
  static const double _FAB_EXPANSION_HEIGHT = 75;

  @override
  void initState() {
    super.initState();

    bloc = BlocProvider.maybeOf<IndexBloc>(context);
  }

  Future<void> _showPermissionAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          key: Key("permissionAlertDialog"),
          title: Text('Camera access needed'),
          content: Text('Permission to access the camera has been denied. Please allow camera access to scan QR codes'),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ); 
  }

  Future<bool> _requestCameraPermission() async {
    // request permission to use camera, 
    // does not show prompt if granted, but returns
    // valid status
    PermissionStatus status = await widget.permissionWrapper.requestCameraPermission();
    return status == PermissionStatus.granted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Generator"),
      ),
      body: Container(
        child: GestureDetector(
          onTap: () => bloc.setFabExpansion(false),
        ),
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: bloc.fabExpansionStream,
        initialData: false,
        builder: (context, snapshot) {
          return ExpandableFab(
            buttonKey: Key("expandingFab"),
            children: [
              ActionButton(
                key: Key("scanCodeButton"),
                icon: Icon(Icons.camera_alt_outlined),
                label: "Scan code",
                onPressed: () async {
                  bool isPermissionGranted = await _requestCameraPermission();
                  isPermissionGranted
                      ? Navigator.of(context).pushNamed("/qr-scan")
                      : _showPermissionAlert();
                },
              ),
              ActionButton(
                key: Key("generateCodeButton"),
                icon: Icon(Icons.refresh),
                label: "Generate code",
                onPressed: () {
                  Navigator.of(context).pushNamed("/qr-generation");
                  bloc.setFabExpansion(false);
                },
              )
            ],
            distance: _FAB_EXPANSION_HEIGHT,
            isExpanded: snapshot.data!,
            onTap: bloc.setFabExpansion,
            expansionChangeListenable: bloc.fabExpansionStream,
          );
        }
      )
    );
  }
}