import 'package:flutter/material.dart';
import 'package:flutterdemo/theme/dark_theme.dart';
import 'package:flutterdemo/theme/light_color.dart';
import 'package:flutterdemo/util/log_util.dart';
import 'package:get/get.dart';

class AppTheme {
  /// 正常模式主题设置
  static ThemeData lightTheme = ThemeData(brightness: Brightness.light);

  /// 黑暗模式主题设置
  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark);

  static final LightColor _lightColor = LightColor();
  static final DarkColor _darkColor = DarkColor();
  static const String TEXT_PRIMARY = 'TEXT_PRIMARY';
  static final _colors = {
    TEXT_PRIMARY: [_lightColor.textPrimary, _darkColor.textPrimary],
  };

  static Color getColor(String key) {
    final colors = _colors[key];
    final Color? result;
    if (Get.isDarkMode) {
      result = colors?[1];
    } else {
      result = colors?[0];
    }
    return result ?? Colors.black;
  }

  /// 切换主题
  static void changeThemeMode({ThemeMode themeMode = ThemeMode.system}) {
    LogUtil.d("changeTheme:${Get.isDarkMode}");

    /// 注意样式设置
    switch (themeMode) {
      case ThemeMode.system:
        if (Get.isDarkMode) {
          Get.changeTheme(lightTheme);
        } else {
          Get.changeTheme(darkTheme);
        }
        break;
      case ThemeMode.dark:
        Get.changeTheme(darkTheme);
        break;
      case ThemeMode.light:
        Get.changeTheme(lightTheme);
        break;
    }
    LogUtil.d("changeTheme1:${Get.isDarkMode}");
  }
}
