import 'package:flutterdemo/theme/app_theme.dart';
import 'package:flutterdemo/util/extension/extension_util.dart';
import 'package:flutter/material.dart';

class TextCommon extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final bool bold;
  final bool softWrap;
  final bool medium;
  final bool heavy;
  final bool center;
  final int? maxLines;
  final TextDecoration? decoration;
  final double? lineHeight;
  final TextStyle? style;
  final TextAlign? align;
  final Key? key;
  final FontWeight? fontWeight;
  final List<Shadow>? shadow;
  final TextOverflow? overflow;

  const TextCommon(this.text,
      {this.color,
      this.size,
      this.bold = false,
      this.heavy = false,
      this.softWrap = false,
      this.center = false,
      this.medium = false,
      this.maxLines,
      this.decoration,
      this.lineHeight,
      this.style,
      this.key,
      this.align,
      this.fontWeight,
      this.shadow,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    // return ExtendedText(
    return Text(
      text,
      key: key,
      textAlign: align,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      softWrap: softWrap,
      style: style ??
          TextStyle(
              decoration: decoration,
              color: color ?? AppTheme.themeColor.textPrimary,
              fontSize: size ?? 24.sp,
              fontWeight: fontWeight,
              height:
                  lineHeight == null ? 1.0 : (lineHeight! / (size ?? 1)) * 1.0,
              shadows: shadow,
              overflow: overflow),
    );
  }
}
