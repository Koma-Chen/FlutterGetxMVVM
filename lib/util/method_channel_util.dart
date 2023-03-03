import 'package:flutter/services.dart';

class MethodChannelUtil {
  final MethodChannel _methodChannel =
      MethodChannel('com.flutter.demo/method_channel');

  factory MethodChannelUtil() => _instance;

  MethodChannelUtil._();

  static final MethodChannelUtil _instance = MethodChannelUtil._();

  void init() {
    _methodChannel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'test':
          break;
      }
    });
  }
}
