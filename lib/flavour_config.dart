import 'package:injectable/injectable.dart';

class FlavourConfig {
  static late Map<String, dynamic> _config;

  static void setEnvironment(String env) {
    switch (env) {
      case Environment.dev:
        _config = _Config.debugConstants;
        break;
      case Environment.prod:
        _config = _Config.prodConstants;
        break;
    }
  }

  static String get whereAmI {
    return _config[_Config.flavour] as String;
  }
}

class _Config {
  static const flavour = 'flavour';

  static Map<String, dynamic> debugConstants = {
    flavour: 'dev',
  };

  static Map<String, dynamic> prodConstants = {
    flavour: 'prod',
  };
}
