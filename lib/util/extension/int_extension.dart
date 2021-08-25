import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemo/util/ScreenAdapter.dart';

extension IntFit on int {
  double get width {
    return ScreenAdapter.setWidth(toDouble());
  }

  double get height {
    return toDouble() / 2;
  }

  double get fontSize {
    return ScreenAdapter.setSp(toDouble());
  }

  double get imageSize {
    return ScreenUtil().setSp(toDouble());
  }

  double get responsiveFont {
    return ScreenAdapter.setSp(toDouble());
  }

  SizedBox get heightBox {
    return heightBoxAdapter;
  }

  SizedBox get heightBoxAdapter {
    return SizedBox(
      height: heightAdapter,
    );
  }

  SizedBox get widthBox {
    return SizedBox(
      width: width,
    );
  }

  double get heightAdapter {
    return ScreenAdapter.setHeight(toDouble());
  }

  Future get millisecondsDelay async =>
      Future.delayed(Duration(milliseconds: this));
}
