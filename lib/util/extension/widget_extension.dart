import 'package:flutter/material.dart';
import 'package:flutterdemo/util/margin_padding_util.dart';
import 'package:flutterdemo/widget/my_click_event.dart';

extension WidgetExtension on Widget {
  Widget getPadding(double padding) {
    return Padding(padding: MarginPaddingUtil.all(padding), child: this);
  }

  Widget getPaddingLTRB(double left, double top, double right, double bottom) {
    return Padding(
        padding: MarginPaddingUtil.fromLTRB(
            left: left, top: top, right: right, bottom: bottom),
        child: this);
  }

  Widget getMargin(int margin) {
    return Container(
        padding: MarginPaddingUtil.all(margin.toDouble()), child: this);
  }

  Widget getMarginLTRB(double left, double top, double right, double bottom) {
    return Container(
        margin: MarginPaddingUtil.fromLTRB(
            left: left, top: top, right: right, bottom: bottom),
        child: this);
  }

  Widget addClickEvent(VoidCallback onPress, {bool useThrottle = true}) {
    return useThrottle
        ? MyGestureDetector(onTap: onPress, child: this)
        : GestureDetector(onTap: onPress, child: this);
  }
}
