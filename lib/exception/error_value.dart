import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:universal_io/io.dart';

import 'api_exception.dart';

class ErrorValue extends Equatable {
  final Type type;
  final String message;

  const ErrorValue(this.type, this.message);

  @override
  List<Object> get props => [type];

  static ErrorValue extract(Exception e) {
    if (e is ApiException) {
      return ErrorValue(Type.HTTP_STATUS_CODE, '${e.code} ${e.errorMessage}');
    } else if (e is SocketException) {
      return ErrorValue(Type.NO_INTERNET_CONNECTION, '');
    } else if (e is TimeoutException) {
      return ErrorValue(Type.REQUEST_TIMEOUT, '');
    } else {
      // handle others
      return ErrorValue(Type.UNKNOWN, e.toString());
    }
  }
}

enum Type {
  UNKNOWN,
  NO_INTERNET_CONNECTION,
  SERVER_ERROR,
  SESSION_EXPIRE,
  REQUEST_TIMEOUT,
  INVALID_PHONE_NUMBER,
  INVALID_CODE,
  WRONG_CODE,
  INVALID_PASSWORD,
  PASSWORDS_DO_NOT_MATCH,
  ACCOUNT_EXISTS,
  DATA_EMPTY,
  INVALID_PARAM,
  PARSE_ERROR,
  ACCOUNT_NOT_EXISTS,
  URL_NOT_FOUND,
  HTTP_STATUS_CODE // define error code
}
