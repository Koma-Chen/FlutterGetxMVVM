import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static double sWidth = 0;
  static double sWidthPx = 0;
  static double sHeight = 0;
  static double sHeightPx = 0;
  static double _ratio = 0;

  static init(BuildContext context, double width, double height,
      bool allowFontScaling) {
    sWidth = MediaQuery.of(context).size.width;
    sHeight = MediaQuery.of(context).size.height;
    _ratio = MediaQuery.of(context).devicePixelRatio;
    sWidthPx = sWidth * _ratio;
    sHeightPx = sHeight * _ratio;
  }

  static double setSp(double value) {
    return ScreenUtil().setSp(value);

    /// 获取 计算后的字体
  }

  static double setHeight(double value) {
    return ScreenUtil().setHeight(value);

    /// 获取 计算后的高度
  }

  static double setWidth(double value) {
    return ScreenUtil().setWidth(value);

    /// 获取 计算后的宽度
  }

  static double screenHeight() {
    return ScreenUtil().screenHeight;

    /// 获取 计算后的屏幕高度
  }

  static double screenWidth() {
    return ScreenUtil().screenWidth;

    /// 获取 计算后的屏幕高度
  }

  // 获取设备设备的像素密度
  static double pixelRatio() {
    return ScreenUtil().pixelRatio;
  }

  static double getWidth({required double width}) {
    return setWidth(width);
  }
}
