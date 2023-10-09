import 'package:flutter_application_test_public/flavour_config.dart';
import 'package:flutter_application_test_public/main.dart';
import 'package:injectable/injectable.dart';

void main() {
  Constants.setEnvironment(Environment.dev);
  initializeApp();
}
