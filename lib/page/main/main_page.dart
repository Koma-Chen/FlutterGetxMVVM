import 'package:flutter/material.dart';
import 'package:flutterdemo/mvvm/base/base_state.dart';
import 'package:flutterdemo/page/main/controller/main_controller.dart';
import 'package:flutterdemo/theme/app_theme.dart';
import 'package:flutterdemo/util/extension/extension_util.dart';
import 'package:flutterdemo/util/extension/widget_extension.dart';
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
          100.heightBox,
          TextCommon(
            "text".tr,
            color: AppTheme.themeColor.textPrimary,
          ).addClickEvent(
            () {
              AppTheme.changeThemeMode();
              Get.forceAppUpdate();
            },
          ),
          GetBuilder<MainController>(
            builder: (logic) {
              return TextCommon(
                controller.bean?.token ?? "",
                maxLines: 10,
              );
            },
            id: "token",
          ),
          GetBuilder<MainController>(
            builder: (logic) {
              return TextCommon(controller.bean?.expire ?? "");
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
