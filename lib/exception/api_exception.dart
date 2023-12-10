import 'package:dio/dio.dart';

class ApiException extends DioError {
  int? code;
  String? errorMessage;
  RequestOptions options;
  
  ApiException({required this.options, this.code, this.errorMessage})
      : super(requestOptions: options);
}