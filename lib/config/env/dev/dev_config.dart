import 'package:badminton_court_booking/common/constant/enum.dart';
import 'package:badminton_court_booking/config/env/base_config.dart';

class DevConfig extends BaseConfig {
  String get apiHost => 'http://127.0.0.1:8000/api/';
  String get socketURL => '';
  String get newsHost => '';
  InterceptorType get interceptorType => InterceptorType.CLIENT;
}