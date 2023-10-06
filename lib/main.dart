import 'package:flutter/material.dart';
import 'package:flutter_application_test_public/src/bloc_observer.dart';
import 'package:flutter_application_test_public/src/locator.dart';
import 'package:flutter_application_test_public/src/presentation/widgets/navbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavbarWidget(),
    );
  }
}
