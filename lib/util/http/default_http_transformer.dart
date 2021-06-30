import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterdemo/util/http/http_response.dart';

/// Response 解析
abstract class HttpTransformer {
  HttpResponse parse(Response response);
}

class DefaultHttpTransformer extends HttpTransformer {
// 假设接口返回类型
//   {
//     "code": 100,
//     "data": {},
//     "message": "success"
// }
  @override
  HttpResponse parse(Response response) {
    Map<String, dynamic> json;
    if (response.data is String) {
      json = jsonDecode(response.data);
    } else {
      json = response.data;
    }
    ResponseData respData = ResponseData.fromJson(json);
    response.data = respData.data;
    return HttpResponse.success(response.data);
  }

  /// 单例对象
  static DefaultHttpTransformer _instance = DefaultHttpTransformer._internal();

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

class ResponseData extends BaseResponseData {
  ResponseData.fromJson(Map<String, dynamic> json) {
    data = json['data'] == null ? {} : json['data'];
    msg = json['errorMessage'];
    code = json['code'];
  }
}
