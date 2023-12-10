import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../../remote/api_url.dart';
import 'interceptor_factory.dart';

/**
 * InterceptorsWrapper: All of the requests enter the interceptor at once, rather than executing sequentially.
 */
class MockInterceptor extends InterceptorsWrapper with InterceptorFactory {
  static const _jsonDir = 'assets/json/response';
  static const _jsonExtension = '.json';
  var isRefreshToken = true;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    await Future.delayed(Duration(seconds: 1));

    if (options.path.contains(ApiURL.kLogin) || options.path.contains(ApiURL.kRefreshToken)) {
      isRefreshToken = false;
      final map = await _buildLoginResponse();
      handler.resolve(Response(data: map, statusCode: 200, requestOptions: options), true);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    await handleResponse(response, handler);

  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) async {
    await handleError(error, handler);
    // todo handle if refresh token failed or 401
  }

  dynamic _buildLoginResponse() async {
    final resourcePath = _jsonDir + '/user' + _jsonExtension;
    final data = await rootBundle.load(resourcePath);
    return json.decode(
      utf8.decode(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      ),
    );
  }

}