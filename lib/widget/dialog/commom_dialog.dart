import 'package:flutterdemo/theme/app_theme.dart';
import 'package:flutterdemo/util/extension/extension_util.dart';
import 'package:flutterdemo/util/extension/widget_extension.dart';
import 'package:flutterdemo/util/margin_padding_util.dart';
import 'package:flutterdemo/widget/text/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonDialog extends StatelessWidget {
  final String title;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const CommonDialog(
      {super.key, required this.title, this.onConfirm, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MarginPaddingUtil.only(left: 80, right: 80),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppTheme.themeColor.textPrimary,
          borderRadius: BorderRadius.circular(14.sp)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          70.heightBox,
          TextCommon(
            title,
            color: AppTheme.themeColor.textPrimary,
            align: TextAlign.center,
            size: 30.sp,
          ),
          50.heightBox,
          Container(
            width: double.infinity,
            height: 1.height,
            color: AppTheme.themeColor.textPrimary,
          ),
          Container(
            height: 80.height,
            child: Row(
              children: [
                Expanded(
                  child: TextCommon(
                    "取消",
                    color: AppTheme.themeColor.textPrimary,
                    align: TextAlign.center,
                    size: 30.sp,
                  ).addClickEvent(() => onCancel?.call()),
                ),
                VerticalDivider(
                  color: AppTheme.themeColor.textPrimary,
                  width: 1.width,
                ),
                Expanded(
                  child: TextCommon(
                    "确定",
                    color: AppTheme.themeColor.textPrimary,
                    align: TextAlign.center,
                    size: 30.sp,
                  ).addClickEvent(() => onConfirm?.call()),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
