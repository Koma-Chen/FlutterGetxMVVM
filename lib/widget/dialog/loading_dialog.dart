import 'package:flutter/material.dart';
import 'package:flutterdemo/config/resource_mananger.dart';
import 'package:flutterdemo/util/extension/extension_util.dart';
import 'package:flutterdemo/util/margin_padding_util.dart';
import 'package:flutterdemo/widget/text/text_common.dart';

// ignore: must_be_immutable
class LoadingDialog extends Dialog {
  String text;

  LoadingDialog({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: MarginPaddingUtil.fromLTRB(
            left: 32, right: 32, top: 20, bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            color: Color(0x50000000)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 34.sp,
                height: 34.sp,
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation(ColorsHelper.primaryColor),
                    strokeWidth: 4),
              ),
              16.widthBox,
              TextCommon(text, color: Colors.white)
            ]));
  }
}
