import 'package:flutterdemo/theme/app_theme.dart';
import 'package:flutterdemo/util/extension/extension_util.dart';
import 'package:flutterdemo/widget/image_extended.dart';
import 'package:flutterdemo/widget/text/text_common.dart';
import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final String iconUrl;
  final String text;
  final double? iconWidth;
  final double? iconHeight;
  final double? interval;
  final double? textSize;
  final Color? textColor;

  const IconTextWidget(
      {Key? key,
      required this.iconUrl,
      required this.text,
      this.iconWidth,
      this.iconHeight,
      this.interval,
      this.textSize,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageCommon(
          iconUrl,
          width: iconWidth ?? 20.width,
          height: iconHeight ?? 20.height,
        ),
        (interval ?? 10).heightBox,
        TextCommon(
          text,
          size: textSize,
          color: textColor ?? AppTheme.themeColor.textPrimary,
        )
      ],
    );
  }
}
