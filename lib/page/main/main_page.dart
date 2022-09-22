import 'package:flutter/material.dart';
import 'package:flutterdemo/mvvm/base/base_state.dart';
import 'package:flutterdemo/page/main/controller/main_controller.dart';
import 'package:flutterdemo/widget/text/text_common.dart';
import 'package:get/get.dart';

class MainPage extends BaseState<MainController> {
  @override
  Widget initView(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextCommon("data"),
          GetBuilder<MainController>(
            builder: (logic) {
              return TextCommon(controller.bean.value?.token ?? "");
            },
            id: "token",
          ),
          GetBuilder<MainController>(
            builder: (logic) {
              return TextCommon(controller.bean.value?.expire ?? "");
            },
            id: "time",
          ),
        ],
      ),
    );
  }

  @override
  MainController initViewModel() => MainController();
}

// class MainPage extends GetView<MainController> {
//
//   @override
//   Widget build(BuildContext context) {
//     controller.login();
//     return Container();
//   }
// }
