import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterdemo/util/http/http_response.dart';

/// Response 解析
abstract class HttpTransformer {
  HttpResponse parse(Response response);
}

class DefaultHttpTransformer extends HttpTransformer {

  static List<int> successCode = [
    // 业务成功
    0,
  ];

  @override
  HttpResponse parse(Response response) {
    int code = response.data['code'];
    if (!successCode.contains(code)) {
      return HttpResponse.failure(
          errorCode: code, errorMsg: response.data['message']);
    }
    Map<String, dynamic> json;
    if (response.data is String) {
      json = jsonDecode(response.data);
    } else {
      json = response.data;
    }
    final DefaultResponseData respData = DefaultResponseData.fromJson(json);
    response.data = respData.data;
    return HttpResponse.success(response.data);
  }

  /// 单例对象
  static final DefaultHttpTransformer _instance =
      DefaultHttpTransformer._internal();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  DefaultHttpTransformer._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory DefaultHttpTransformer.getInstance() => _instance;
}

/// 子类需要重写
abstract class BaseResponseData {
  int? code = 0;
  dynamic data;
  String? msg;

  BaseResponseData({this.code, this.data, this.msg});

  @override
  String toString() {
    return 'BaseResponseData{code: $code, data: $data, msg: $msg}';
  }
}

class DefaultResponseData extends BaseResponseData {
  DefaultResponseData.fromJson(Map<String, dynamic> json) {
    data = json['data'] ?? {};
    msg = json['message'];
    code = json['code'];
  }
}
