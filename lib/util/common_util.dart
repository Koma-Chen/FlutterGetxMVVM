import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/config/constant.dart';
import 'package:flutterdemo/util/size_adapted/size_adapt_util.dart';

class CommonUtils {
  static double formatNum(double num, int postion) {
    double result = 0;
    if ((num.toString().length - num.toString().lastIndexOf(".") - 1) <
        postion) {
      //小数点后有几位小数
      result = double.parse(num.toStringAsFixed(postion)
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString());
    } else {
      result = double.parse(num.toString()
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString());
    }
    return result;
  }

  static bool isPhoneCorrect(String phone) {
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    bool matched = exp.hasMatch(phone);
    return matched;
  }

  static Future<bool> checkHasInternet() async {
    bool result = true;
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      result = false;
    }
    return result;
  }

  static bool fileIsImage(String url) {
    if (url.endsWith("png") ||
        url.contains("jpg") ||
        url.endsWith("PNG") ||
        url.endsWith("JPG") ||
        url.endsWith("JPEG") ||
        url.endsWith("jpeg"))
      return true;
    else
      return false;
  }

  static Widget getBottomPadding() {
    return Platform.isAndroid ? 170.heightBoxAdapter : 200.heightBoxAdapter;
  }

  static String getNetImgUrl(String img) {
    return "${Constant.QI_NIU_PREFIX}$img.png";
  }

  static String getSubStr(String data, int position) {
    return data.length > position ? "${data.substring(0, 10)}..." : data;
  }

  static List<FocusNode> createFocusNode(int num) {
    List<FocusNode> result = [];
    for (int i = 0; i < num; i++) {
      result.add(new FocusNode());
    }
    return result;
  }
}
