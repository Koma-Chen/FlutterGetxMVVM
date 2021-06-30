import 'package:flutter/material.dart';
import 'package:flutterdemo/mvvm/base/base_state.dart';
import 'package:flutterdemo/viewmodel/main_view_model.dart';
import 'package:flutterdemo/widget/text/text_common.dart';
import 'package:get/get.dart';

class MainPage extends BaseState<MainViewModel> {
  final mViewModel = Get.put(MainViewModel());

  @override
  void initData(context) {
    Future.delayed(Duration(seconds: 2), () {
      mViewModel.login();
    });
  }

  @override
  Widget initView(BuildContext context, MainViewModel? model) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Container(child: TextCommon(model?.bean.token ?? "")));
  }
}
