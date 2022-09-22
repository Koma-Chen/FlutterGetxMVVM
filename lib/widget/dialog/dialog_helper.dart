import 'dart:convert';

import 'package:flutter/cupertino.dart'
    hide CupertinoAlertDialog, CupertinoDialogAction;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutterdemo/widget/dialog/custom_widget_dialog.dart';
import 'package:get/get.dart';

class DialogHelper {
  static void showCustomWidgetDialog(Widget widget,
      {VoidCallback? onCancel,
      VoidCallback? onConfirm,
      bool touchOutCancel = false}) {
    showGeneralDialog<dynamic>(
        context: Get.key.currentState!.context,
        pageBuilder: (context, anim1, anim2) {
          return Transform.scale(
              scale: anim1.value,
              child: Opacity(
                  opacity: anim1.value,
                  child: CustomWidgetDialog(widget: widget)));
        },
        barrierColor: Colors.black.withOpacity(.6),
        barrierDismissible: touchOutCancel,
        barrierLabel: "",
        transitionDuration: Duration(milliseconds: 150));
  }

  static void dismiss() => SmartDialog.dismiss();
}
