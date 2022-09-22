import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class ToastUtil {
  static void showLoading({String? title}) {
    SmartDialog.showLoading(msg: title??"");
  }

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

// static Widget _buildToastWidget(String msg, String imgUrl) {
//   return Container(
//     padding: MarginPaddingUtil.onlyAdapterHeight(
//         top: 20, bottom: 20, left: 32, right: 32),
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ImageCommon(imgUrl, size: 34.imageSize),
//         10.widthBox,
//         Container(
//           constraints: BoxConstraints(maxWidth: 200),
//           child: TextCommon(msg,
//               size: 28,
//               color: Colors.white,
//               maxLines: 1000,
//               center: true),
//         )
//       ],
//     ),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.imageSize),
//         color: Color(0x60000000)),
//   );
// }
}
