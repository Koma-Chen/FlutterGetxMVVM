import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class PrettyDioLogger extends Interceptor {
  /// Print request header [Options.headers]
  final bool requestHeader;

  /// Print [Options.queryParameters]
  final bool queryParameters;

  /// Print request data [Options.data]
  final bool requestBody;

  /// Print [Response.data]
  final bool responseBody;

  /// Print [Response.headers]
  final bool responseHeader;

  /// Print error message
  final bool error;

  /// Print processing time from request to complete in [inMilliseconds]
  final bool showProcessingTime;

  /// Print log
  final bool canShowLog;

  /// Print cURL
  final bool showCUrl;

  /// Print FormData
  final bool convertFormData;

  /// Log printer; defaults logPrint log to console.
  /// you can also write log in a file.
  final void Function(String msg) logPrint;

  final JsonEncoder _encoder = const JsonEncoder.withIndent('\t');

  PrettyDioLogger({
    this.requestHeader = false,
    this.queryParameters = false,
    this.requestBody = false,
    this.responseHeader = false,
    this.responseBody = true,
    this.error = true,
    this.showProcessingTime = true,
    this.logPrint = log,
    this.canShowLog = false,
    this.showCUrl = false,
    this.convertFormData = false,
  });

  late DateTime _startTime;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (canShowLog) {
      try {
        _logOnRequest(options);
      } catch (e) {
        _defaultLog('PrettyDioLogger: $e');
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (canShowLog) {
      try {
        _logOnError(err);
      } catch (e) {
        _defaultLog('PrettyDioLogger: $e');
      }
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (canShowLog) {
      try {
        _logOnResponse(response);
      } catch (e) {
        _defaultLog('PrettyDioLogger: $e');
      }
    }
    super.onResponse(response, handler);
  }

  void _logOnRequest(RequestOptions options) {
    _startTime = DateTime.now();
    _logBlock(isBegin: true, type: 'onRequest');
    final uri = options.uri;
    final method = options.method;
    _defaultLog('Request ║ $method ');
    _defaultLog('Uri ║ ${uri.toString()}');
    if (showCUrl) {
      _cURLRepresentation(options);
    }
    if (requestHeader) {
      final requestHeaders = <String, dynamic>{};
      requestHeaders.addAll(options.headers);
      requestHeaders['contentType'] = options.contentType?.toString();
      requestHeaders['responseType'] = options.responseType.toString();
      requestHeaders['followRedirects'] = options.followRedirects;
      requestHeaders['connectTimeout'] = options.connectTimeout?.inMilliseconds;
      requestHeaders['receiveTimeout'] = options.receiveTimeout?.inMilliseconds;
      String json = _encoder.convert(requestHeaders);
      _defaultLog('[---requestHeader---]\n$json');
    }
    if (queryParameters) {
      String json = _encoder.convert(options.queryParameters);
      _defaultLog('[---queryParameters---]\n$json');
    }
    if (requestBody) {
      _defaultLog('[---requestBody---]');
      final dynamic data = options.data;
      if (data is Map) {
        String json = _encoder.convert(options.data);
        _defaultLog(json);
      }
      if (data is FormData) {
        _defaultLog('[---FormData---]');
        final formDataMap = <String, dynamic>{}
          ..addEntries(data.fields)
          ..addEntries(data.files);
        formDataMap.forEach((key, value) => _defaultLog('$key: $value'));
      } else {
        _defaultLog(data.toString());
      }
    }
  }

  void _logOnError(DioError err) {
    _logBlock(isBegin: true, type: 'onError');
    if (error) {
      final uri = err.requestOptions.uri;
      _defaultLog(
          'DioError ║ Status: ${err.response?.statusCode} ${err.response?.statusMessage}');
      _defaultLog('Uri ║ ${uri.toString()}');
      if (err.response != null && err.response?.data != null) {
        _defaultLog(err.response.toString());
      }
    }
    _logProcessingTime();
    _logBlock(isBegin: false);
  }

  void _logOnResponse(Response response) {
    _logBlock(isBegin: true, type: 'onResponse');
    final uri = response.requestOptions.uri;
    final method = response.requestOptions.method;
    _defaultLog(
        'Response ║ $method ║ Status: ${response.statusCode} ${response.statusMessage}');
    _defaultLog('Uri ║ ${uri.toString()}');

    if (responseHeader) {
      final responseHeaders = <String, String>{};
      response.headers
          .forEach((k, list) => responseHeaders[k] = list.toString());
      String json = _encoder.convert(responseHeaders);
      _defaultLog('[---responseHeader---]\n$json');
    }

    if (responseBody) {
      String json = _encoder.convert(response.data);
      _defaultLog('[---responseBody---]\n$json');
    }
    _logProcessingTime();
    _logBlock(isBegin: false);
  }

  void _cURLRepresentation(RequestOptions options) {
    List<String> components = ['curl -i'];
    components.add('-X ${options.method}');

    options.headers.forEach((k, v) {
      if (k != 'Cookie') {
        components.add('-H "$k: $v"');
      }
    });

    if (options.data != null) {
      if (options.data is FormData) {
        if (convertFormData) {
          final fieldData = Map.fromEntries(options.data.fields);
          fieldData.forEach((key, value) {
            components.add('--form $key="$value"');
          });
          final fileData = Map.fromEntries(options.data.files);
          fileData.forEach((key, value) {
            // can show file name only
            components.add('--form =@"${(value as MultipartFile).filename}"');
          });
        }
      } else if (options.headers['content-type'] ==
          'application/x-www-form-urlencoded') {
        options.data.forEach((k, v) {
          components.add('-d "$k=$v"');
        });
      } else {
        final data = json.encode(options.data).replaceAll('"', '\\"');
        components.add('-d "$data"');
      }
    }

    components.add('"${options.uri.toString()}"');

    String cURL = components.join(' \\\n\t');
    _defaultLog('[---cURL---]\n$cURL');
  }

  void _defaultLog(String msg) {
    logPrint(msg);
  }

  void _logBlock({
    bool isBegin = true,
    String type = '',
  }) {
    logPrint(
        '=============================================$type=========${isBegin ? 'BEGIN' : 'END'}=====================================================================');
  }

  void _logProcessingTime() {
    if (showProcessingTime) {
      logPrint(
          'Processing Time: ${DateTime.now().difference(_startTime).inMilliseconds.toString()} ms');
    }
  }
}