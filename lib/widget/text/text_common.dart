import 'package:extended_text/extended_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/config/resource_mananger.dart';

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
      this.shadow});

  @override
  Widget build(BuildContext context) {
    return ExtendedText(text,
        key: key,
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        softWrap: softWrap,
        style: style ??
            TextStyle(
                decoration: decoration,
                color: color ?? ColorsHelper.sixColor,
                fontSize: size,
                fontWeight: fontWeight,
                height: lineHeight == null
                    ? 1.0
                    : (lineHeight! / (size ?? 1)) * 1.0,
                shadows: shadow));
  }
}
