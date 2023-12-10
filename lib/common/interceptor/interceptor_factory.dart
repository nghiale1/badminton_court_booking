import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:badminton_court_booking/common/constant/enum.dart';
import 'package:badminton_court_booking/exception/api_exception.dart';

import '../../model/response/response_data.dart';
import '../../config/env/env.dart';
import '../../di/get_it.dart';
import '../../model/request/auth_request.dart';
import '../../remote/api_url.dart';
import '../../remote/auth_service.dart';
import '../constant/constant.dart';
import '../helper/pref_helper.dart';
import 'client_interceptor.dart';
import 'mock_interceptor.dart';

abstract class InterceptorFactory {

  static Interceptor makeInterceptor() {
    var type = Env.instance.config.interceptorType;
    switch(type) {
      case InterceptorType.CLIENT:
        return ClientInterceptor();
      case InterceptorType.MOCK:
        return MockInterceptor();
    }
  }

  dynamic handleRequest(
    RequestOptions request,
    RequestInterceptorHandler handler,
  ) async {
    var pref = getItInstance.get<PrefHelper>();
    var locale = await pref.getLocale();
    var user = await pref.getUser();

    // locale
    request.headers.addAll({'Accept-Language': locale.toString()});

    // token
    if (!request.uri.toString().contains(ApiURL.kLogin)) {

    }

    return handler.next(request);
  }

  dynamic handleResponse(
      Response response, ResponseInterceptorHandler handler) async {
    ResponseData data = ResponseData.fromJson(jsonDecode(response.toString()));
    switch (data.code) {
      case 0:
        {
          // success
          response.data = data.data;
          return handler.resolve(response);
        }
      default:
        return handler.reject(ApiException(
            options: response.requestOptions,
            code: data.code,
            errorMessage: data.message));
    }
  }

  dynamic handleError(DioError error, ErrorInterceptorHandler handler) async {
    var pref = getItInstance.get<PrefHelper>();
    var dio = getItInstance.get<Dio>(instanceName: DioInstanceName.kApiHost);
    switch (error.response?.statusCode) {
      case 401:
        {
          // token expired
          await _refreshToken();
          var user = await pref.getUser();
          // update new token
          dio.options.headers['Authorization'] = 'Bearer ${user.refreshToken}';
          var requestOptions = error.requestOptions;

          final options = Options(method: requestOptions.method);
          var newResponse = await dio.request(
            requestOptions.path,
            cancelToken: requestOptions.cancelToken,
            options: options,
            data: requestOptions.data,
            queryParameters: requestOptions.queryParameters,
          );
          return handler.resolve(newResponse);
        }
      default:
        return handler.next(error);
    }
  }

  _refreshToken() async {
    var pref = getItInstance.get<PrefHelper>();
    var authService = getItInstance.get<AuthService>();
    var user = await pref.getUser();

    var request = AuthRequest.refreshTokenRequest(user.refreshToken);
    var response = await authService.refreshToken(request);
    pref.setUser(response);
  }
}
