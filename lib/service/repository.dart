import 'dart:io';

import 'package:flutterdemo/model/login/login_bean.dart';
import 'package:flutterdemo/util/AddressManager.dart';
import 'package:flutterdemo/util/http/http_Client.dart';
import 'package:get/get.dart';

class Repository {
  static Future login(String phone, int smsCode, String code, String type,
      String appleId) async {
    HttpClient client = Get.find<HttpClient>();
    var response = await client.post(AddressManager.login, data: {
      "mobile": phone,
      "code": code,
      "smsCode": smsCode,
      "appleId": appleId,
      "deviceId": "174e763467504dfd8e2bb17e959a5c15",
      "deviceType": Platform.isIOS ? 1 : 2
    }, queryParameters: {
      "type": "app"
    });
    return LoginBean().fromJson(response.data);
  }
}
