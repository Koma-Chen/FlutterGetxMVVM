import 'package:flutterdemo/widget/dialog/commom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class DialogHelper {
  static void showCustomWidgetDialog(WidgetBuilder widget,
      {bool touchOutsideCancel = false, AlignmentGeometry? alignment}) {
    SmartDialog.show(
      builder: widget,
      backDismiss: touchOutsideCancel,
      alignment: alignment,
    );
  }

  static void showCommonDialog(
      {required String title,
      VoidCallback? onConfirm,
      VoidCallback? onCancel}) {
    SmartDialog.show(
        builder: (context) => CommonDialog(
              title: title,
              onCancel: () async {
                await dismiss();
                onCancel?.call();
              },
              onConfirm: () async {
                await dismiss();
                onConfirm?.call();
              },
            ));
  }

  static void showLoading({String? title}) {
    SmartDialog.showLoading(msg: title ?? "");
  }


  static Future<void> dismiss() => SmartDialog.dismiss();
}
