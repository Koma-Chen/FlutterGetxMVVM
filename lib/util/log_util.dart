import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutterdemo/config/config.dart';
import 'package:logger/logger.dart';

class LogUtil {
  LogUtil._();

  static final _logger = Logger(
    printer: PrefixPrinter(PrettyPrinter(
      printTime: true,
    )),
  );

  /// 调试时，调用这个方法
  static void d(dynamic message) {
    if (!Config.isDebug) return;
    _logger.d("koma===$message");
  }

  /// 打印错误日志时，调用这个方法
  static void e(dynamic message) {
    if (!Config.isDebug) return;
    _logger.e("koma===$message");
  }

  static void json(Map map) {
    final JsonEncoder encoder = JsonEncoder.withIndent('  ');
    compute(_normalPrint, encoder.convert(map));
  }

  static String _normalPrint(String message) {
    debugPrint("koma===$message");
    return "";
  }

  static const _separator = "=";
  static const _split =
      "$_separator$_separator$_separator$_separator$_separator$_separator$_separator$_separator$_separator";
  static var _title = "Yl-Log";
  static var _isDebug = true;
  static int _limitLength = 800;
  static String _startLine = "$_split$_title$_split";
  static String _endLine = "$_split$_separator$_separator$_separator$_split";

  static void init(
      {required String title,
      required bool isDebug,
      required int limitLength}) {
    _title = title;
    _isDebug = isDebug;
    _limitLength = limitLength;
    _startLine = "$_split$_title$_split";
    final endLineStr = StringBuffer();
    final cnCharReg = RegExp("[\u4e00-\u9fa5]");
    for (int i = 0; i < _startLine.length; i++) {
      if (cnCharReg.stringMatch(_startLine[i]) != null) {
        endLineStr.write(_separator);
      }
      endLineStr.write(_separator);
    }
    _endLine = endLineStr.toString();
  }

  //仅Debug模式可见
  static void long(dynamic obj) {
    if (_isDebug) {
      _log(obj.toString());
    }
  }

  static void v(dynamic obj) {
    _log(obj.toString());
  }

  static void _log(String msg) {
    debugPrint(_startLine);
    _logEmpyLine();
    if (msg.length < _limitLength) {
      debugPrint(msg);
    } else {
      segmentationLog(msg);
    }
    _logEmpyLine();
    debugPrint(_endLine);
  }

  static void segmentationLog(String msg) {
    final outStr = StringBuffer();
    for (var index = 0; index < msg.length; index++) {
      outStr.write(msg[index]);
      if (index % _limitLength == 0 && index != 0) {
        debugPrint(outStr.toString());
        outStr.clear();
        final lastIndex = index + 1;
        if (msg.length - lastIndex < _limitLength) {
          final remainderStr = msg.substring(lastIndex, msg.length);
          debugPrint(remainderStr);
          break;
        }
      }
    }
  }

  static void _logEmpyLine() {
    debugPrint("");
  }
}
