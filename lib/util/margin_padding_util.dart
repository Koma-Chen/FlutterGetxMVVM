import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/util/ScreenAdapter.dart';

class MarginPaddingUtil {
  static EdgeInsetsGeometry only(
      {double left = 0.0,
      double top = 0.0,
      double right = 0.0,
      double bottom = 0.0}) {
    return fromLTRB(left: left, top: top, right: right, bottom: bottom);
  }

  static EdgeInsetsGeometry onlyAdapterHeight(
      {double left = 0.0,
      double top = 0.0,
      double right = 0.0,
      double bottom = 0.0}) {
    return fromLTRBAdapterHeight(
        left: left, top: top, right: right, bottom: bottom);
  }

  static EdgeInsets all(double margin) {
    return EdgeInsets.all(ScreenAdapter.setWidth(margin));
  }

  static EdgeInsets fromLTRB(
      {required double left,
      required double top,
      required double right,
      required double bottom}) {
    return fromLTRBAdapterHeight(left: left, top: top, right: right, bottom: bottom);
    // return EdgeInsets.fromLTRB(left, top, right, bottom);
  }

  static EdgeInsets fromLTRBAdapterHeight(
      {required double left,
      required double top,
      required double right,
      required double bottom}) {
    return EdgeInsets.only(
        left: ScreenAdapter.getWidth(width: left),
        top: ScreenAdapter.setHeight(top),
        right: ScreenAdapter.getWidth(width: right),
        bottom: ScreenAdapter.setHeight(bottom));
    // return EdgeInsets.fromLTRB(left, top, right, bottom);
  }
}
