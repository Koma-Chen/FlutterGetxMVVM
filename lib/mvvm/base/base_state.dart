import 'package:flutter/material.dart';
import 'package:flutterdemo/mvvm/base/base_controller.dart';
import 'package:get/get.dart';

abstract class BaseState<BC extends BaseController> extends GetView<BC> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      initState: (GetBuilderState<BC> state) {
        _initState(context);
        initState.call(state);
        print("koma===initState");
      },
      builder: (BC controller) {
        return initView(context);
      },
    );
  }

  /// 父类初始化一些数据
  void _initState(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => afterFirstFrameLayout(context));
    Get.lazyPut(() => initController());
    initControllers().forEach((element) {
      Get.lazyPut(() => element);
    });
  }

  /// 初始化一些数据
  void initState(GetBuilderState<BC> state) {}

  /// 初始化View
  Widget initView(BuildContext context);

  /// 初始化ViewModel
  BC initController();

  /// 第一帧绘制完毕后
  /// Does *not* request a new frame.
  void afterFirstFrameLayout(BuildContext context) {}

  /// 如果当前页面不止一个controller的话，可以用数组来初始化
  List<GetxController> initControllers() {
    return [];
  }
}
