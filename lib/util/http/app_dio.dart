import 'package:flutterdemo/util/http/interceptor/PrettyDioLogger.dart';
import 'package:flutterdemo/util/http/interceptor/request_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutterdemo/config/config.dart';
import 'package:flutterdemo/util/http/interceptor/dio_logger.dart';
import 'package:flutterdemo/util/http/http_config.dart';
import 'package:dio/io.dart';

class AppDio with DioMixin implements Dio {
  AppDio({BaseOptions? options, HttpConfig? dioConfig}) {
    options ??= BaseOptions(
      baseUrl: dioConfig?.baseUrl ?? "",
      contentType: Headers.jsonContentType,
      connectTimeout: dioConfig?.connectTimeout,
      sendTimeout: dioConfig?.sendTimeout,
      receiveTimeout: dioConfig?.receiveTimeout,
    );
    this.options = options;

    interceptors.add(RequestInterceptor());
    if (Config.isDebug) interceptors.add(PrettyDioLogger());
    if (dioConfig?.interceptors?.isNotEmpty ?? false) {
      interceptors.addAll(interceptors);
    }
    httpClientAdapter = DefaultHttpClientAdapter();
    if (dioConfig?.proxy?.isNotEmpty ?? false) {
      setProxy(dioConfig!.proxy!);
    }
  }

  setProxy(String proxy) {
    (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (uri) {
        return "PROXY $proxy";
      };
    };
  }
}
