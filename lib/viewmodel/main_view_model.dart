import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/model/login/login_bean.dart';
import 'package:flutterdemo/mvvm/base/base_view_model.dart';
import 'package:flutterdemo/service/repository.dart';
import 'package:flutterdemo/util/http/http_client.dart';
import 'package:get/get.dart';

class MainViewModel extends BaseViewModel {
  LoginBean bean = LoginBean();
  HttpClient client = Get.find<HttpClient>();

  Future<bool> login() async {
    try {
      setBusy();
      bean = await Repository.login<LoginBean>("13243756408", 666666, "", "", "");
      return true;
    } on DioError catch (e) {
      debugPrint("登录失败:${jsonDecode(e.response.toString())['errorMessage']}");
      return false;
    } finally {
      setIdle();
    }
  }
}
