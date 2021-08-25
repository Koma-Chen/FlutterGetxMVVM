import 'package:flutter/material.dart';
import 'package:flutterdemo/util/ScreenAdapter.dart';

extension DoubleFit on double {
  double get width {
    return ScreenAdapter.setWidth(toDouble());
  }

  double get responsiveSize {
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
}
