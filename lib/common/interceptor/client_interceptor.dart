import 'package:dio/dio.dart';

import 'interceptor_factory.dart';

/**
 * QueuedInterceptorsWrapper: All of the requests enter the interceptor sequentially by QueuedInterceptors
 */
class ClientInterceptor extends QueuedInterceptorsWrapper with InterceptorFactory {

  @override
  void onRequest(RequestOptions request, RequestInterceptorHandler handler) async {
    await handleRequest(request, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    await handleResponse(response, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) async {
    await handleError(error, handler);
  }
}