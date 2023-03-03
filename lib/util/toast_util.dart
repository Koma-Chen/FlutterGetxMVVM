import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class ToastUtil {
  static void showWidgetDialog(Widget widget) {
    // SmartDialog.show(widget: widget);
  }

  static void showSuccess(String msg) {
    SmartDialog.showToast(msg);
    // SmartDialog.show(widget: _buildToastWidget(msg, "img_success_toast"),
    //     duration: Duration(seconds: 3));
  }

  static void showFailed(String msg) {
    SmartDialog.showToast(msg);
  }

  static void showTips(String msg) {
    SmartDialog.showToast(msg);
  }

}
