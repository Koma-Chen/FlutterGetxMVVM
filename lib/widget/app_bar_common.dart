import 'package:flutterdemo/theme/app_theme.dart';
import 'package:flutterdemo/util/extension/extension_util.dart';
import 'package:flutterdemo/util/extension/widget_extension.dart';
import 'package:flutterdemo/util/margin_padding_util.dart';
import 'package:flutterdemo/widget/text/text_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBarCommon extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? rightWidget;
  final VoidCallback? leftClick;

  const AppBarCommon(
      {Key? key, required this.title, this.rightWidget, this.leftClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: AppTheme.themeColor.textPrimary,
      padding: MarginPaddingUtil.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 50.width,
                child: Icon(
                  Icons.keyboard_arrow_left,
                  size: 50.sp,
                  color: AppTheme.themeColor.textPrimary,
                ),
              ).addClickEvent(() {
                if (leftClick == null)
                  Get.back();
                else
                  leftClick!.call();
              }),
              TextCommon(
                title,
                color: AppTheme.themeColor.textPrimary,
                size: 40.sp,
              ),
              rightWidget ??
                  SizedBox(
                    width: 50.width,
                  )
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(Get.width, 80.height);
}
