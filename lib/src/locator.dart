import 'package:flutter/foundation.dart';
import 'package:flutter_application_test_public/src/bloc/counter_bloc.dart';
import 'package:flutter_application_test_public/src/domain/repositories/counter_repository.dart';
import 'package:flutter_application_test_public/src/injector/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.init(environment: kDebugMode ? Environment.dev : Environment.prod);

  getIt.registerSingleton<CounterRepository>;

  getIt.registerSingleton<CounterBloc>(
    CounterBloc(getIt<CounterRepository>()),
  );
}
