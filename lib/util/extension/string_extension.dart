import 'package:flutter/material.dart';
import 'package:flutterdemo/util/log_util.dart';
import 'package:flutterdemo/util/toast_util.dart';

extension StringExtension on String {
  double get parseDouble {
    return double.tryParse(this) ?? 0.0;
  }

  int get parseInt {
    return int.tryParse(this) ?? 0;
  }

  void showFailed() {
    if (this != "") ToastUtil.showFailed(this);
  }

  void showSuccess() {
    if (this != "") ToastUtil.showSuccess(this);
  }

  void showTips() {
    if (this != "") ToastUtil.showTips(this);
  }

  void logd() {
    if (this != "") LogUtil.d(this);
  }

  void printString() {
    if (this != "") debugPrint("$this");
  }

  //字符转换成Color对象
  Color get toColor {
    Color color = Colors.white;
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      color = Color("0x$hexColor".parseInt);
    }
    return color;
  }

}
