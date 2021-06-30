import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdemo/config/resource_mananger.dart';
import 'package:flutterdemo/widget/image_extended.dart';

class FieldCommon extends StatelessWidget {
  final TextEditingController controller;
  final bool clear;
  final bool look;
  final BoxDecoration? decoration;
  final bool enabled;
  final FocusNode? focusNode;
  final double? fontSize;
  final double? height;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  bool obscureText;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry? padding;
  final String? placeholder;
  final TextStyle? placeholderStyle;
  final Widget? prefix;
  final bool? readOnly;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final GestureTapCallback? onTap;
  final Color? backgroundColor;

  FieldCommon({
    Key? key,
    required this.controller,
    this.backgroundColor,
    this.clear: false,
    this.look: false,
    this.decoration,
    this.enabled = true,
    this.focusNode,
    this.fontSize,
    this.height,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.obscureText = false,
    this.onSubmitted,
    this.onChanged,
    this.padding,
    this.placeholder,
    this.placeholderStyle,
    this.prefix,
    this.readOnly,
    this.style,
    this.textAlign,
    this.textInputAction,
    this.onTap,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.transparent,
      height: height ?? 42,
      child: CupertinoTextField(
        onEditingComplete: onEditingComplete,
        controller: controller,
        decoration: decoration,
        enabled: enabled,
        focusNode: focusNode,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        obscureText: obscureText,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        padding: padding ?? EdgeInsets.zero,
        placeholder: placeholder,
        placeholderStyle: placeholderStyle ??
            TextStyle(color: ColorsHelper.hintColor, fontSize: fontSize ?? 14, height: 1.6),
        prefix: prefix,
        style: style ??
            TextStyle(color: ColorsHelper.threeColor, fontSize: fontSize ?? 16, height: 1.4),
        suffixMode: OverlayVisibilityMode.editing,
        suffix: clear
            ? GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ImageCommon('field_clear', size: 14),
                ),
                onTap: onTap ?? () => controller.clear(),
              )
            : look
                ? GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ImageCommon(obscureText ? 'look_n' : 'look_s', size: 14),
                    ),
                    onTap: onTap ??
                        () {
                          obscureText = !obscureText;

                          /// 知识点
                          (context as Element).markNeedsBuild();
                        },
                  )
                : SizedBox(),
        textAlign: textAlign ?? TextAlign.start,
        textInputAction: textInputAction ?? TextInputAction.next,
        readOnly: readOnly ?? false,
        cursorColor: ColorsHelper.primaryColor,
      ),
    );
  }
}
