import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdemo/config/resource_mananger.dart';
import 'package:flutterdemo/util/margin_padding_util.dart';
import 'package:flutterdemo/widget/text/field_common.dart';
import 'package:flutterdemo/util/extension/extension_util.dart';

class TextFieldCommon extends StatelessWidget {
  final bool enable;

  // final String text;
  final TextEditingController controller;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final double? size;
  final double? hintSize;
  final double? width;
  final double? height;
  final TextAlign? align;
  final TextInputType? keyboardType;
  final Color? hintColor;
  final Color? textColor;
  final Color? backgroundColor;
  final int? maxLines;
  final FocusNode? focusNode;
  final double? borderRadius;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final bool isOnlyInt;
  final bool isOnlyDouble;
  final int? doubleLength;
  final int? maxLetters;

  const TextFieldCommon(
      {Key? key,
      // @required this.text,
      required this.controller,
      this.hintText,
      this.onChanged,
      this.enable = true,
      this.size,
      this.align,
      this.hintColor,
      this.textColor,
      this.width,
      this.maxLines,
      this.height,
      this.focusNode,
      this.backgroundColor,
      this.borderRadius = 4.0,
      this.textInputAction,
      this.keyboardType,
      this.onSubmitted,
      this.hintSize,
      this.inputFormatters,
      this.isOnlyInt = false,
      this.isOnlyDouble = false,
      this.doubleLength = 2,
      this.maxLetters = 1000})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: height ?? 50,
      width: width ?? 50,
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius ?? 0)),
      child: Row(
        children: <Widget>[
          // SizedBox(width: 15),
          // TextCommon(text ?? '', color: ColorsHelper.threeColor, size: 14),
          Expanded(
            child: FieldCommon(
              height: height ?? 50,
              controller: controller,
              placeholder: hintText,
              placeholderStyle: TextStyle(
                  color: hintColor ?? ColorsHelper.nineColor,
                  fontSize: hintSize),
              onChanged: onChanged,
              fontSize: size ?? 24.sp,
              backgroundColor: Colors.transparent,
              enabled: enable,
              textAlign: align,
              keyboardType: isOnlyInt
                  ? TextInputType.numberWithOptions(decimal: true)
                  : keyboardType,
              style: TextStyle(
                  color: textColor ?? ColorsHelper.threeColor, fontSize: size),
              maxLines: maxLines ?? 1,
              focusNode: focusNode ?? new FocusNode(),
              textInputAction: textInputAction ?? TextInputAction.done,
              onSubmitted: onSubmitted,
              padding: MarginPaddingUtil.all(0),
              inputFormatters: isOnlyInt
                  ? [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      LengthLimitingTextInputFormatter(maxLetters)
                    ]
                  : isOnlyDouble
                      ? [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                          LengthLimitingTextInputFormatter(maxLetters)
                        ]
                      : [LengthLimitingTextInputFormatter(maxLetters)],
            ),
          ),
        ],
      ),
    );
  }
}
