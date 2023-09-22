import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  static Future<void> checkPermission() async {
    var permission = await Permission.storage.request();
    if (permission.isGranted) {
    } else {
      checkPermission();
    }
  }
}
