import 'dart:io';

import 'package:flutterdemo/util/address_manager.dart';
import 'package:flutterdemo/util/http/http_client.dart';
import 'package:get/get.dart';

class Repository {
  static HttpClient client = Get.find<HttpClient>();

  static Future<T> login<T>(String phone, int smsCode, String code, String type,
      String appleId) async {
    final T result = await client.post<T>(AddressManager.login, data: {
      "mobile": phone,
      "code": code,
      "smsCode": smsCode,
      "appleId": "",
      "deviceId": "174e763467504dfd8e2bb17e959a5c15",
      "deviceType": Platform.isIOS ? 1 : 2
    }, queryParameters: {
      "type": "app"
    });
    return result;
  }
}
