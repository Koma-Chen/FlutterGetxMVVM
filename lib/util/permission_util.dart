// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:flutter_easy_permission/easy_permissions.dart';
// import 'package:flutterdemo/util/common_util.dart';
//
// typedef PermissionGrant = void Function();
// typedef PermissionDenied = void Function();
//
// class PermissionUtil {
//   static late FlutterEasyPermission _easyPermission;
//
//   static Future<bool> requestPermissions(
//       {List<Permissions>? androidPermission,
//       List<PermissionGroup>? iosPermission,
//       required PermissionGrant onGranted,
//       PermissionDenied? onDenied}) async {
//     // [PermissionName.Storage, PermissionName.Microphone]
//     _easyPermission = FlutterEasyPermission()
//       ..addPermissionCallback(onGranted: (requestCode, perms, perm) {
//         // debugPrint("android获得授权:$perms");
//         // debugPrint("iOS获得授权:$perm");
//       }, onDenied: (requestCode, perms, perm, isPermanent) {
//         if (isPermanent) {
//           FlutterEasyPermission.showAppSettingsDialog(title: "Camera");
//         } else {
//           // debugPrint("android授权失败:$perms");
//           // debugPrint("iOS授权失败:$perm");
//         }
//       });
//
//     FlutterEasyPermission.request(
//         perms: androidPermission ?? [],
//         permsGroup: iosPermission ?? [],
//         rationale: "Test permission requests here");
//
//     final List<Permissions> list =
//         await Permission.requestPermissions(permissionNameList);
//     bool allow = true;
//     list.forEach((permission) {
//       if (permission.permissionStatus != PermissionStatus.allow) {
//         allow = false;
//       }
//     });
//     return allow;
//   }
//
//   static Future<bool> checkPermissions(List<Permissions>? androidPermission,
//       List<PermissionGroup>? iosPermission) async {
//     final bool result = await FlutterEasyPermission.has(
//         perms: androidPermission ?? [], permsGroup: iosPermission ?? []);
//     return result;
//   }
// }
