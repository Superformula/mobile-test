import 'package:permission_handler/permission_handler.dart';

class PermissionWrapper {

  PermissionWrapper();

  Future<PermissionStatus> requestCameraPermission() async {
    return await Permission.camera.request();
  }
}