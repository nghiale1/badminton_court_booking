import 'dart:async';

final validateEmail =
StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
  if (value.length != 1) {
    isEmail(value)
        ? sink.add(value)
        : sink.addError('Please provide a correct email');
  }
});

final validatePassword =
StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
  if (value.length != 0) {
    value.length >= 8
        ? sink.add(value)
        : sink.addError('Password should be 8 characters long');
  }
});

bool isEmail(String email) {
  String value =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(value);
  return regExp.hasMatch(email);
}