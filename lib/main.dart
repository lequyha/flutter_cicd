import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/flavour_config.dart';
import 'package:flutter_application_test_public/src/bloc_observer.dart';
import 'package:flutter_application_test_public/src/locator.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/navbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger();

void initializeApp() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  initializeDependencies();

  late String appTitle;

  if (FlavourConfig.whereAmI == Environment.dev) {
    appTitle = 'App Dev';

    debugPrint('Flavor: $appTitle');
  } else if (FlavourConfig.whereAmI == Environment.prod) {
    appTitle = 'App Prod ';

    debugPrint('Flavor: $appTitle');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String? appTitle;
  const MyApp({super.key, this.appTitle});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle ?? '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavbarWidget(),
    );
  }
}
