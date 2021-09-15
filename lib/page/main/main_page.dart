
import 'package:flutter/material.dart';
import 'package:flutterdemo/mvvm/base/base_state.dart';
import 'package:flutterdemo/viewmodel/main_view_model.dart';
import 'package:flutterdemo/widget/base/base_scaffold.dart';
import 'package:flutterdemo/widget/text/text_common.dart';
import 'package:flutterdemo/widget/text/text_field_common.dart';
import 'package:get/get.dart';

class MainPage extends BaseState<MainViewModel> {
  final mViewModel = Get.put(MainViewModel());
  final controller = TextEditingController();

  RxString test = "".obs;

  @override
  void initData(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      mViewModel.login();
      // ToastUtil.showLoading(title: "loading...");
    });
    // ever(test, (_) => print("${_} has been changed"));
    // interval(test, (_) => print("interval $_"), time: Duration(seconds: 1));
    debounce(test, (_) => print("debouce$_"), time: Duration(seconds: 1));
  }

  @override
  Widget initView(BuildContext context, MainViewModel? model) {
    return BaseScaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Column(
          children: [
            _buildTestWidget(),
            Obx(() => TextCommon(model?.bean.value.token ?? "")),
            Container(
              width: 100,
              height: 100,
              child: TextFieldCommon(
                controller: controller,
                hintText: "111",
                onChanged: (text) {
                  test.value = text;
                },
              ),
            ),
            // TextCommon(model?.bean.value.token ?? ""),
          ],
        ));
  }

  Widget _buildTestWidget() {
    return Container(width: 100, height: 100, color: Colors.red);
  }
}
