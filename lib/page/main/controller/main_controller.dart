import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/mvvm/base/base_controller.dart';
import 'package:flutterdemo/page/main/data/login_bean.dart';
import 'package:flutterdemo/page/main/service/main_service.dart';
import 'package:flutterdemo/page/main/service/main_service_impl.dart';
import 'package:flutterdemo/util/http/http_exception.dart';

class MainController extends BaseController {
  LoginBean? bean = LoginBean();
  late MainService _mainService;


  MainController(){
   print("koma===MainController");
  }

  @override
  void onInit() {
    super.onInit();
    _mainService = MainServiceImpl();
    // _mainService = MainServiceMockImpl();
  }

  @override
  void onReady() {
    super.onReady();
    login();
  }

  Future<bool> login() async {
    try {
      setBusy();
      bean = await _mainService.login<LoginBean>(
          "13243756407", 666666, "", "", "");
      update(['token', 'time']);
      return true;
    } on HttpException catch (e) {
      debugPrint("登录失败:${e.message}");
      return false;
    } finally {
      setIdle();
    }
  }
}
