import 'package:flutter/services.dart';

// 只允许输入两位小数
TextInputFormatter doubleFormatter(int dot) =>
    FilteringTextInputFormatter.allow(RegExp("^(\\d+)?\\.?\\d{0," + "$dot}"));
