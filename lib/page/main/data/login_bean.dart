import 'dart:convert';

import 'package:flutterdemo/generated/json/base/json_field.dart';
import 'package:flutterdemo/generated/json/login_bean.g.dart';

@JsonSerializable()
class LoginBean {
  String? token;
  String? expire;

  LoginBean();

  factory LoginBean.fromJson(Map<String, dynamic> json) =>
      $LoginBeanFromJson(json);

  Map<String, dynamic> toJson() => $LoginBeanToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
