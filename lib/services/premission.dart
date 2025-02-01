import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<void> requestStorePermissions() async {
    if (await Permission.storage.request().isGranted) {
      // Permission granted
    } else {
      // Handle the case when permission is not granted
    }
  }
}
