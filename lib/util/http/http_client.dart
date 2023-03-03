import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutterdemo/config/constant.dart';
import 'package:flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:flutterdemo/util/common_util.dart';
import 'package:flutterdemo/util/http/app_dio.dart';
import 'package:flutterdemo/util/http/default_http_transformer.dart';
import 'package:flutterdemo/util/http/http_config.dart';
import 'package:flutterdemo/util/http/http_exception.dart';
import 'package:flutterdemo/util/http/http_response.dart';

class HttpClient {
  late final AppDio dio;

  HttpClient({BaseOptions? options, HttpConfig? dioConfig})
      : dio = AppDio(options: options, dioConfig: dioConfig);

  Future<T?> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    HttpTransformer? httpTransformer,

    /// 是否需要自动转换json为实体类，比如List<List>这种数据结构就无法转换，只能返回调用方手动解析
    bool needJsonConvert = true,
  }) async {
    try {
      final response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      final HttpResponse httpResponse =
          handleResponse<T>(response, httpTransformer: httpTransformer);
      if (httpResponse.ok) {
        return when(needJsonConvert,
                JsonConvert.fromJsonAsT<T>(httpResponse.data)) ??
            httpResponse.data;
      } else {
        throw httpResponse.error ?? UnknownException();
      }
    } on Exception catch (e) {
      throw _parseException(e);
    }
  }

  Future<T?> post<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    HttpTransformer? httpTransformer,

    /// 是否需要自动转换json为实体类，比如List<List>这种数据结构就无法转换，只能返回调用方手动解析
    bool needJsonConvert = true,
  }) async {
    try {
      final response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      final HttpResponse httpResponse =
          handleResponse<T>(response, httpTransformer: httpTransformer);
      if (httpResponse.ok) {
        if (needJsonConvert) {
          return JsonConvert.fromJsonAsT<T>(httpResponse.data);
        } else {
          return httpResponse.data;
        }
      } else {
        throw httpResponse.error ?? UnknownException();
      }
    } on Exception catch (e) {
      throw _parseException(e);
    }
  }

  HttpResponse handleResponse<T>(Response? response,
      {HttpTransformer? httpTransformer}) {
    httpTransformer ??= DefaultHttpTransformer.getInstance();

    // 返回值异常
    if (response == null) {
      return HttpResponse.failureFromError();
    }

    // token失效
    if (_isTokenTimeout(response.statusCode)) {
      return HttpResponse.failureFromError(
          UnauthorisedException(message: "没有权限", code: response.statusCode));
    }
    // 接口调用成功
    if (_isRequestSuccess(response.statusCode, response.data['code'])) {
      return httpTransformer.parse(response);
    } else {
      // 接口调用失败
      return HttpResponse.failure(
          errorMsg: response.data?['message'] ?? response.statusMessage,
          errorCode: response.data?['code'] ?? response.statusCode);
    }
  }

  /// 鉴权失败
  bool _isTokenTimeout(int? code) {
    return code == 401;
  }

  /// 请求成功
  bool _isRequestSuccess(int? statusCode, int bizCode) {
    return statusCode != null &&
        statusCode >= 200 &&
        statusCode < 300 &&
        DefaultHttpTransformer.successCode.contains(bizCode);
  }

  HttpException _parseException(Exception error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.connectionTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          return NetworkException(message: error.message);
        case DioErrorType.badCertificate:
          return BadCertificateException(error.message);
        case DioErrorType.badResponse:
          try {
            final int? errCode = error.response?.statusCode;
            switch (errCode) {
              case 400:
                return BadRequestException(message: "请求语法错误", code: errCode);
              case 401:
                return UnauthorisedException(message: "没有权限", code: errCode);
              case 403:
                return BadRequestException(message: "服务器拒绝执行", code: errCode);
              case 404:
                return BadRequestException(message: "无法连接服务器", code: errCode);
              case 405:
                return BadRequestException(message: "请求方法被禁止", code: errCode);
              case 500:
                return BadServiceException(message: "服务器内部错误", code: errCode);
              case 502:
                return BadServiceException(message: "无效的请求", code: errCode);
              case 503:
                return BadServiceException(message: "服务器挂了", code: errCode);
              case 505:
                return UnauthorisedException(
                    message: "不支持HTTP协议请求", code: errCode);
              default:
                return UnknownException(error.message);
            }
          } on Exception catch (_) {
            return UnknownException(error.message);
          }
        case DioErrorType.cancel:
          return CancelException(error.message);
        case DioErrorType.connectionError:
          return NetworkException(message: error.message);
        case DioErrorType.unknown:
          if (error.error is SocketException) {
            return NetworkException(message: error.message);
          } else {
            return UnknownException(error.message);
          }
        default:
          return UnknownException(error.message);
      }
    } else if (error is HttpException) {
      if (error.code == Constant.TOKEN_EXPIRED_CODE) {}
      return error;
    } else {
      return UnknownException(error.toString());
    }
  }
}
