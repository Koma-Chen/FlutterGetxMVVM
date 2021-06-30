import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sizeAdapt {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? rpx;
  static double? px;

  static void initialize(BuildContext context, {double standardWidth = 750}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = (_mediaQueryData?.devicePixelRatio ?? 0) *
        (_mediaQueryData?.size.width ?? 0);
    screenHeight = (_mediaQueryData?.devicePixelRatio ?? 0) *
        (_mediaQueryData?.size.height ?? 0);
    rpx = standardWidth / (screenWidth ?? 1);
    px = screenWidth ?? 0 / standardWidth * 2;
  }

  // 按照像素来设置
  static double setPx(double size) {
    return size;
  }

  // 按照rxp来设置
  static double setRpx(double size) {
    return size / 2;
  }
}
