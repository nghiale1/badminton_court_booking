import 'package:badminton_court_booking/config/env/base_config.dart';
import 'package:badminton_court_booking/config/env/dev/dev_config.dart';
import 'package:badminton_court_booking/config/env/prod/prod_config.dart';
import 'package:badminton_court_booking/config/env/staging/staging_config.dart';

class Env {
  factory Env() {
    return instance;
  }

  Env._internal();
  static final Env instance = Env._internal();

  static const String DEV = 'DEV';
  static const String STAGING = 'STAGING';
  static const String PROD = 'PROD';

  BaseConfig config = DevConfig();

  initConfig(String env) {
    config = _getConfig(env);
  }

  BaseConfig _getConfig(String env) {
    switch(env) {
      case Env.PROD:
        return ProdConfig();
      case Env.STAGING:
        return StagingConfig();
      default:
        return DevConfig();
    }
  }
}