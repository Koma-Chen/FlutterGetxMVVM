import 'dart:io';

import 'package:flutterdemo/util/common_util.dart';
import 'package:permission/permission.dart';

class PermissionUtil {
  static Future<bool> requestPermissions(
      List<PermissionName> permissionNameList) async {
    // [PermissionName.Storage, PermissionName.Microphone]

    if (Platform.isIOS) return true;

    final List<Permissions> list =
        await Permission.requestPermissions(permissionNameList);
    bool allow = true;
    list.forEach((permission) {
      if (permission.permissionStatus != PermissionStatus.allow) {
        allow = false;
      }
    });
    return allow;
  }

  static Future<bool> checkStoragePermission() async {
    return requestPermissions([PermissionName.Storage]);
  }
}
