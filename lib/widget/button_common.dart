import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemo/config/resource_mananger.dart';
import 'package:flutterdemo/util/margin_padding_util.dart';
import 'package:flutterdemo/util/extension/extension_util.dart';
import 'package:flutterdemo/widget/text/text_common.dart';

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

  ButtonCommon({
    Key? key,
    this.color,
    this.width,
    this.height,
    this.margin,
    this.fontSize,
    this.medium = false,
    @required this.text,
    @required this.onTap,
    this.fontWeight,
    this.fontHeight,
    this.fontColor,
    this.padding,
    this.borderRadios,
    this.boxDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            height: height ?? 50.heightAdapter,
            decoration: boxDecoration ??
                BoxDecoration(
                    color: color ?? ColorsHelper.primaryColor,
                    borderRadius: BorderRadius.circular(
                        borderRadios ?? (height ?? 44 * 0.5))),
            width: width ?? double.infinity,
            margin: margin,
            padding: padding,
            child: Center(
                child: TextCommon(text ?? "",
                    size: fontSize,
                    fontWeight: fontWeight,
                    color: fontColor,
                    height: fontHeight))));
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

  OutlineButtonCommon({
    Key? key,
    this.width,
    this.height,
    this.margin,
    this.fontSize,
    @required this.text,
    @required this.onTap,
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
            width: width ?? ScreenUtil().screenWidth,
            height: height ?? 50.heightAdapter,
            alignment: Alignment.center,
            margin: margin,
            padding: padding ?? MarginPaddingUtil.all(10),
            child: TextCommon(
              text ?? "",
              size: fontSize,
              height: fontHeight,
              color: textColor,
              fontWeight: fontWeight,
            ),
            decoration: boxDecoration ??
                BoxDecoration(
                    color: backgroundColor ?? Colors.transparent,
                    border: Border.all(
                        color: borderColor ?? Color(0xFFE5E5E5),
                        width: borderWidth ?? 1),
                    borderRadius: BorderRadius.circular(borderRadios ?? 5))));
  }
}