import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutterdemo/generated/json/base/json_convert_content.dart';
import 'package:flutterdemo/util/http/app_dio.dart';
import 'package:flutterdemo/util/http/default_http_transformer.dart';
import 'package:flutterdemo/util/http/http_config.dart';
import 'package:flutterdemo/util/http/http_exception.dart';
import 'package:flutterdemo/util/http/http_response.dart';
import 'package:flutterdemo/util/log_util.dart';

class HttpClient {
  late final AppDio _dio;

  HttpClient({BaseOptions? options, HttpConfig? dioConfig})
      : _dio = AppDio(options: options, dioConfig: dioConfig);

  Future<T> get<T>(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      HttpTransformer? httpTransformer}) async {
    // try {
    var response = await _dio.get(
      uri,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return JsonConvert.fromJsonAsT<T>(jsonDecode(response.toString())['data']);
    // } on Exception catch (e) {
    //   return handleException(e);
    // }
  }

  Future<T> post<T>(String uri,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      HttpTransformer? httpTransformer}) async {
    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      // return ;
      return JsonConvert.fromJsonAsT<T>(
          handleResponse<T>(response, httpTransformer: httpTransformer).data);
    } on Exception catch (e) {
      throw _parseException(e);
    }
  }

  Future<HttpResponse> patch(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      HttpTransformer? httpTransformer}) async {
    assert(data != null);
    try {
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return handleResponse(response, httpTransformer: httpTransformer);
    } on Exception catch (e) {
      return handleException(e);
    }
  }

  Future<T> delete<T>(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      HttpTransformer? httpTransformer}) async {
    // try {
    var response = await _dio.delete(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return JsonConvert.fromJsonAsT<T>(jsonDecode(response.toString())['data']);
    // } on Exception catch (e) {
    //   return handleException(e);
    // }
  }

  Future<T> put<T>(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      HttpTransformer? httpTransformer}) async {
    // try {
    var response = await _dio.put(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return JsonConvert.fromJsonAsT<T>(jsonDecode(response.toString())['data']);
    // } on Exception catch (e) {
    //   return handleException(e);
    // }
  }

  Future<Response> download(String urlPath, savePath,
      {ProgressCallback? onReceiveProgress,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      bool deleteOnError = true,
      String lengthHeader = Headers.contentLengthHeader,
      data,
      Options? options,
      HttpTransformer? httpTransformer}) async {
    try {
      var response = await _dio.download(
        urlPath,
        savePath,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
        data: data,
        options: data,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  HttpResponse handleResponse<T>(Response? response,
      {HttpTransformer? httpTransformer}) {
    httpTransformer ??= DefaultHttpTransformer.getInstance();

    // ???????????????
    if (response == null) {
      return HttpResponse.failureFromError();
    }

    // token??????
    if (_isTokenTimeout(response.statusCode)) {
      return HttpResponse.failureFromError(
          UnauthorisedException(message: "????????????", code: response.statusCode));
    }
    // ??????????????????
    if (_isRequestSuccess(response.statusCode)) {
      return httpTransformer.parse(response);
    } else {
      LogUtil.d("response.statusMessage???${response.statusMessage}");
      // ??????????????????
      return HttpResponse.failure(
          errorMsg: response.statusMessage, errorCode: response.statusCode);
    }
  }

  HttpResponse handleException(Exception exception) {
    HttpException parseException = _parseException(exception);
    print("parseException:${parseException}");
    return HttpResponse.failureFromError(parseException);
  }

  /// ????????????
  bool _isTokenTimeout(int? code) {
    return code == 401;
  }

  /// ????????????
  bool _isRequestSuccess(int? statusCode) {
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  HttpException _parseException(Exception error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return NetworkException(message: error.message);
        case DioErrorType.cancel:
          return CancelException(error.message);
        case DioErrorType.response:
          try {
            int? errCode = error.response?.statusCode;
            switch (errCode) {
              case 400:
                return BadRequestException(message: "??????????????????", code: errCode);
              case 401:
                return UnauthorisedException(message: "????????????", code: errCode);
              case 403:
                return BadRequestException(message: "?????????????????????", code: errCode);
              case 404:
                return BadRequestException(message: "?????????????????????", code: errCode);
              case 405:
                return BadRequestException(message: "?????????????????????", code: errCode);
              case 500:
                return BadServiceException(message: "?????????????????????", code: errCode);
              case 502:
                return BadServiceException(message: "???????????????", code: errCode);
              case 503:
                return BadServiceException(message: "???????????????", code: errCode);
              case 505:
                return UnauthorisedException(
                    message: "?????????HTTP????????????", code: errCode);
              default:
                return UnknownException(error.message);
            }
          } on Exception catch (_) {
            return UnknownException(error.message);
          }

        case DioErrorType.other:
          if (error.error is SocketException) {
            return NetworkException(message: error.message);
          } else {
            return UnknownException(error.message);
          }
        default:
          return UnknownException(error.message);
      }
    } else {
      return UnknownException(error.toString());
    }
  }
}
