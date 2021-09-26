import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keframe/frame_separate_widget.dart';

class CustomFrameSeparateWidget extends StatelessWidget {
  final Widget child;
  final Widget? placeHolder;
  final int? index;
  final double? width;
  final double? height;

  const CustomFrameSeparateWidget(
      {Key? key,
      required this.child,
      this.placeHolder,
      this.index,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FrameSeparateWidget(
        placeHolder: placeHolder ??
            SizedBox(
                width: width,
                height: height,
                child: CupertinoActivityIndicator()),
        index: index,
        child: child);
  }
}
