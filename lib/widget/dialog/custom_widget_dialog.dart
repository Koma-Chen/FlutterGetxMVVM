import 'package:flutter/material.dart';

class CustomWidgetDialog extends Dialog {
  final Widget? widget;

  CustomWidgetDialog({@required this.widget, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return widget ?? Container();
  }
}
