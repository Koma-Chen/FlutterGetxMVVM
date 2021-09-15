import 'package:flutter/material.dart';
import 'package:flutterdemo/mvvm/base/base_view_model.dart';
import 'package:get/get.dart';

abstract class BaseState<VM extends BaseViewModel> extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    initData(context);
    return GetBuilder(builder: (VM viewModel) {
      return initView(context, viewModel);
    });
  }

  Widget initView(BuildContext context, VM? model);

  void initData(BuildContext context);
}
