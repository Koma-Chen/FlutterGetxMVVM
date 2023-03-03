import 'dart:io';

import 'package:flutterdemo/config/route_config.dart';
import 'package:flutterdemo/page/main/main_page.dart';
import 'package:flutterdemo/util/http/http_client.dart';
import 'package:flutterdemo/util/http/http_exception.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.white,
      child: Center(
        child: Text("SplashPage"),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 2),
    //     () => Get.offAndToNamed(RouteName.mainPage.toString()));
    test();
  }

  Future<void> test() async {
    final client = Get.find<HttpClient>();
    try {
      await client.get("http://bapi.speediance.top/api/bapp/login/recentlyLoggedUser");
      // await client.get("http://www.baidu.com/my");
    } on HttpException catch (e) {
      print("koma===e:${e.message}");
    }
    Get.to(MainPage());
  }
}
