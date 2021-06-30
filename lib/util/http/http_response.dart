import 'package:flutterdemo/util/http/http_exception.dart';

class HttpResponse {
  late bool ok;
  dynamic data;
  HttpException? error;

  HttpResponse._internal({this.ok = false});

  HttpResponse.success(this.data) {
    this.ok = true;
  }

  HttpResponse.failure({String? errorMsg, int? errorCode}) {
    this.error = BadRequestException(message: errorMsg, code: errorCode);
    this.ok = false;
  }

  HttpResponse.failureFormResponse({dynamic data}) {
    this.error = BadResponseException(data);
    this.ok = false;
  }

  HttpResponse.failureFromError([HttpException? error]) {
    this.error = error ?? UnknownException();
    this.ok = false;
  }
}

/// 子类需要重写
abstract class BaseResponseData {
  int? code = 0;
  dynamic data = "";
  String? msg = "";

  BaseResponseData({this.code, this.data, this.msg});

  @override
  String toString() {
    return 'BaseResponseData{code: $code, data: $data, msg: $msg}';
  }
}
