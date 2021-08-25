import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterdemo/mvvm/base/base_state.dart';
import 'package:flutterdemo/viewmodel/main_view_model.dart';
import 'package:flutterdemo/widget/base/base_scaffold.dart';
import 'package:flutterdemo/widget/text/text_common.dart';
import 'package:get/get.dart';

class MainPage extends BaseState<MainViewModel> {
  final mViewModel = Get.put(MainViewModel());

  @override
  void initData(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      mViewModel.login();
      // ToastUtil.showLoading(title: "loading...");
    });
  }

  @override
  Widget initView(BuildContext context, MainViewModel? model) {
    return BaseScaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Column(
          children: [
            TextCommon(model?.bean.token ?? ""),
          ],
        ));
  }
}
