import 'package:flutterdemo/util/sp_util/shared_preferences.dart';
import 'package:flutterdemo/util/sp_util/sp_key.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonUtils {

  static Future updateLocale(Locale? locale) async {
    late var l;
    if (locale == null) {
      if (SPUtils().getString(SpKey.LANGUAGE) != "zh_CN") {
        l = Locale('zh', 'CN');
      } else {
        l = Locale('en', 'US');
      }
    } else {
      l = locale;
    }
    await SPUtils().setLocalStorage(SpKey.LANGUAGE, l.toString());
    await Get.updateLocale(l);
  }
}

/// Function type that Transform values into a new form.
typedef Mutator<T> = T Function(T);

typedef ValueChangedWithPrevCallback<T> = void Function(T, T);

/// Predicate checker.
/// if [predicate] is passed return [value] otherwise return null.
T? when<T>(bool predicate, T? value) {
  if (predicate == true) {
    return value;
  }
}

void whenDo(bool predicate, VoidCallback call) {
  if (predicate) call.call();
}
