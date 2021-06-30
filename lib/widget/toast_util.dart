import 'package:flutter/material.dart';
import 'package:flutterdemo/util/margin_padding_util.dart';
import 'package:flutterdemo/widget/dialog/loading_dialog.dart';
import 'package:flutterdemo/widget/image_extended.dart';
import 'package:flutterdemo/widget/text/text_common.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutterdemo/util/size_adapted/size_adapt_util.dart';
class ToastUtil {

  static ToastFuture showLoading({String? title, int? seconds}) {
    return showToastWidget(LoadingDialog(text: title ?? "加载中..."),
        duration: Duration(seconds: seconds ?? 1000),
        animationDuration: Duration(milliseconds: 100));
  }

  static ToastFuture showWidgetDialog(Widget widget) {
    return showToastWidget(widget,
        duration: Duration(days: 1),
        animationDuration: Duration(milliseconds: 100));
  }

  static void showSuccess(msg) {
    showToastWidget(_buildToastWidget(msg, "img_success_toast"),
        duration: Duration(seconds: 3));
  }

  static void showFailed(msg) {
    showToastWidget(_buildToastWidget(msg, "img_failed_toast"),
        duration: Duration(seconds: 3));
  }

  static void showTips(msg) {
    showToastWidget(_buildToastWidget(msg, "img_tips_toast"),
        duration: Duration(seconds: 3));
  }

  static Widget _buildToastWidget(String msg, String imgUrl) {
    return Container(
      padding: MarginPaddingUtil.onlyAdapterHeight(
          top: 20, bottom: 20, left: 32, right: 32),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageCommon(imgUrl, size: 34.imageSize),
          10.widthBox,
          Container(
            constraints: BoxConstraints(maxWidth: 200),
            child: TextCommon(msg,
                size: 28,
                color: Colors.white,
                maxLines: 1000,
                center: true),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.imageSize),
          color: Color(0x60000000)),
    );
  }
}
