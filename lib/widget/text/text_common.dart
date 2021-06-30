import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/config/resource_mananger.dart';
import 'package:flutterdemo/util/size_adapted/size_adapt_util.dart';

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
  final double? height;
  final double? ptSize;
  final TextStyle? style;
  final TextAlign? align;
  final Key? key;
  final FontWeight? fontWeight;
  final List<Shadow>? shadow;

  TextCommon(this.text,
      {this.color,
      this.size,
      this.bold: false,
      this.heavy: false,
      this.softWrap: false,
      this.center: false,
      this.medium: false,
      this.maxLines = 1,
      this.decoration,
      this.height,
      this.style,
      this.key,
      this.align,
      this.fontWeight,
      this.ptSize,
      this.shadow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      key: key,
      textAlign: align ?? (center ? TextAlign.center : TextAlign.start),
      maxLines: maxLines ?? 1,
      overflow: maxLines == null ? TextOverflow.visible : TextOverflow.ellipsis,
      softWrap: softWrap,
      style: style ??
          TextStyle(
              decoration: decoration,
              color: color ?? ColorsHelper.sixColor,
              fontSize: ptSize != null
                  ? ptSize
                  : (size == null ? 24.responsiveFont : size?.responsiveFont),
              fontWeight: heavy
                  ? FontWeight.w900
                  : (bold
                      ? FontWeight.bold
                      : (medium
                          ? FontWeight.w500
                          : (fontWeight == null
                              ? FontWeight.normal
                              : fontWeight))),
              height:
                  height == null ? 1.2 : ((height ?? 0) / (size ?? 1)) * 1.0,
              shadows: shadow ?? []),
    );
  }
}
