import 'package:flutter/material.dart';
import 'package:flutterdemo/mvvm/base/base_controller.dart';
import 'package:get/get.dart';

abstract class BaseState<BC extends BaseController> extends GetView<BC> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => initViewModel());
    return GetBuilder(
      id: "root",
      builder: (BC controller) {
        return initView(context);
      },
    );
  }

  Widget initView(BuildContext context);

  BC initViewModel();
}
