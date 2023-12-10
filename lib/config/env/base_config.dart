import 'package:badminton_court_booking/common/constant/enum.dart';

abstract class BaseConfig {
  String get apiHost;
  String get socketURL;
  String get newsHost;
  InterceptorType get interceptorType;
}