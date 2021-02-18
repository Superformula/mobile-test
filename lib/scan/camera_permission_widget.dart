import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermissionWidget extends StatefulWidget {
  const CameraPermissionWidget({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  _CameraPermissionWidgetState createState() => _CameraPermissionWidgetState();
}

class _CameraPermissionWidgetState extends State<CameraPermissionWidget> with WidgetsBindingObserver {
  PermissionStatus _permissionStatus = PermissionStatus.undetermined;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _listenForPermissionStatus();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _listenForPermissionStatus();
    }
  }

  void _listenForPermissionStatus() async {
    final status = await Permission.camera.status;
    print('******************************************* Listened to permission: $status');
    setState(() => _permissionStatus = status);
  }

  @override
  Widget build(BuildContext context) {
    return _permissionStatus == PermissionStatus.granted ? widget.child : _noPermissionMessage();
  }

  Widget _noPermissionMessage() => Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'QRCodz needs access to your camera to scan a QR code',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 16),
              _canAskPermission() ? _askPermissionButton() : _openSettingsButton(),
            ],
          ),
        ),
      );

  bool _canAskPermission() => _permissionStatus.isUndetermined || (Platform.isAndroid && _permissionStatus.isDenied);

  Widget _askPermissionButton() => RaisedButton(
        child: Text('Enable camera access'),
        onPressed: requestPermission,
      );

  Future<void> requestPermission() async {
    final status = await Permission.camera.request();
    setState(() {
      _permissionStatus = status;
    });
  }

  Widget _openSettingsButton() => RaisedButton(
        child: Text('Open settings'),
        onPressed: () => openAppSettings(),
      );
}
