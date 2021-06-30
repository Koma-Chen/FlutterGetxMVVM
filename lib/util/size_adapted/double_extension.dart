import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemo/util/ScreenAdapter.dart';
import 'package:flutterdemo/util/size_adapted/size_adapt.dart';

extension DoubleFit on double {
  double get px {
    return sizeAdapt.setPx(this.toDouble());
  }

  double get rpx {
    return sizeAdapt.setRpx(this.toDouble());
  }

  double get width {
    // return this.toDouble() / 2;
    return ScreenAdapter.setWidth(this.toDouble());
  }

  double get height {
    return this.toDouble() / 2;
    // return ScreenAdapter.setHeight(this.toDouble());
  }

  double get fontSize {
    // return this.toDouble() / 2;
    return ScreenAdapter.setSp(this.toDouble());
  }

  double get imageSize {
    return ScreenUtil().setSp(this.toDouble());
  }

  double get responsiveFont {
    return ScreenAdapter.setSp(this.toDouble());
  }

  SizedBox get heightBox {
    return heightBoxAdapter;
  }

  SizedBox get heightBoxAdapter {
    return SizedBox(
      height: this == null ? 0 : this.heightAdapter,
    );
  }

  SizedBox get widthBox {
    return SizedBox(
      width: this.width,
    );
  }

  double get heightAdapter {
    // return this.toDouble() / 2;
    if (this == 0) return 0;
    return ScreenAdapter.setHeight(this.toDouble());
  }
}
