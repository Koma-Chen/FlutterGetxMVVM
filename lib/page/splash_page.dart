import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/config/route_config.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => new SplashPageState();
}

class SplashPageState extends State<SplashPage>
    with AfterLayoutMixin<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1),
        () => Get.toNamed(RouteName.mainPage.toString()));
  }

  @override
  void afterFirstLayout(BuildContext context) {}
}
