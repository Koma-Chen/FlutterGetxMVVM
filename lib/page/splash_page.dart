import 'package:flutter/material.dart';
import 'package:flutterdemo/config/route_config.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: Text("SplashPage"),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),
        () => Get.offAndToNamed(RouteName.mainPage.toString()));
  }
}
