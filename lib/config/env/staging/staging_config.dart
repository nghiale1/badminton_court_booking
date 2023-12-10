import 'package:badminton_court_booking/common/constant/enum.dart';
import 'package:badminton_court_booking/config/env/base_config.dart';

class StagingConfig extends BaseConfig {
  String get apiHost => '';
  String get socketURL => '';
  String get newsHost => '';
  InterceptorType get interceptorType => InterceptorType.CLIENT;
}