import 'package:flutterdemo/theme/app_theme.dart';
import 'package:flutterdemo/util/extension/extension_util.dart';
import 'package:flutterdemo/util/extension/widget_extension.dart';
import 'package:flutterdemo/util/margin_padding_util.dart';
import 'package:flutterdemo/widget/text/text_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonCommon extends StatelessWidget {
  final Color? color;
  final Color? fontColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final double? fontHeight;
  final String? text;
  final VoidCallback? onTap;
  final bool? medium;
  final FontWeight? fontWeight;
  final double? borderRadios;
  final BoxDecoration? boxDecoration;

  const ButtonCommon({
    Key? key,
    this.color,
    this.width,
    this.height,
    this.margin,
    this.fontSize,
    this.medium = false,
    required this.text,
    required this.onTap,
    this.fontWeight,
    this.fontHeight,
    this.fontColor,
    this.padding,
    this.borderRadios,
    this.boxDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration ??
          BoxDecoration(
              color: color ?? AppTheme.themeColor.textPrimary,
              borderRadius: BorderRadius.circular(borderRadios ?? 5.sp)),
      width: width ?? double.infinity,
      margin: margin,
      padding:
          padding ?? MarginPaddingUtil.symmetric(vertical: 20, horizontal: 30),
      child: TextCommon(
        text ?? "",
        size: fontSize,
        fontWeight: fontWeight,
        color: fontColor ?? AppTheme.themeColor.textPrimary,
        lineHeight: fontHeight,
        align: TextAlign.center,
      ),
    ).addClickEvent(() => onTap?.call());
  }
}

class OutlineButtonCommon extends StatelessWidget {
  final double? width;
  final double? height;
  final double? fontHeight;
  final double? borderRadios;
  final double? borderWidth;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final String? text;
  final VoidCallback? onTap;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final FontWeight? fontWeight;
  final BoxDecoration? boxDecoration;

  const OutlineButtonCommon({
    Key? key,
    this.width,
    this.height,
    this.margin,
    this.fontSize,
    required this.text,
    required this.onTap,
    this.borderRadios,
    this.textColor,
    this.borderColor,
    this.borderWidth,
    this.backgroundColor,
    this.fontHeight,
    this.padding,
    this.fontWeight,
    this.boxDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            width: width ?? Get.width,
            height: height ?? 50.height,
            alignment: Alignment.center,
            margin: margin,
            padding: padding ?? MarginPaddingUtil.all(10),
            decoration: boxDecoration ??
                BoxDecoration(
                    color: backgroundColor ?? Colors.transparent,
                    border: Border.all(
                        color: backgroundColor ?? AppTheme.themeColor.textPrimary,
                        width: borderWidth ?? 1),
                    borderRadius: BorderRadius.circular(borderRadios ?? 5)),
            child: TextCommon(
              text ?? "",
              size: fontSize,
              lineHeight: fontHeight,
              color: textColor ?? AppTheme.themeColor.textPrimary,
              fontWeight: fontWeight,
            )));
  }
}
