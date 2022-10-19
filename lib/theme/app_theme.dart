import 'package:flutter/material.dart';
import 'package:flutterdemo/theme/dark_theme.dart';
import 'package:flutterdemo/theme/light_color.dart';
import 'package:flutterdemo/theme/theme_color.dart';
import 'package:get/get.dart';

class AppTheme {
  /// 正常模式主题设置
  static ThemeData lightTheme = ThemeData(brightness: Brightness.light);

  /// 黑暗模式主题设置
  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark);

  static final LightColor _lightColor = LightColor();
  static final DarkColor _darkColor = DarkColor();

  static ThemeColor themeColor = _lightColor;

  /// 切换主题
  static void changeThemeMode({ThemeMode themeMode = ThemeMode.system}) {
    /// 注意样式设置
    switch (themeMode) {
      case ThemeMode.system:
        if (Get.isDarkMode) {
          Get.changeTheme(lightTheme);
          themeColor = _lightColor;
        } else {
          Get.changeTheme(darkTheme);
          themeColor = _darkColor;
        }
        break;
      case ThemeMode.dark:
        Get.changeTheme(darkTheme);
        themeColor = _darkColor;
        break;
      case ThemeMode.light:
        Get.changeTheme(lightTheme);
        themeColor = _lightColor;
        break;
    }
  }
}
