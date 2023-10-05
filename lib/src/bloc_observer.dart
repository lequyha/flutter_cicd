import 'package:flutter_application_test_public/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.i(
      'onCreate -- ${bloc.runtimeType}',
      time: DateTime.now(),
    );
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.i(
      'onEvent -- ${bloc.runtimeType}, $event',
      time: DateTime.now(),
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.i(
      'onChange -- ${bloc.runtimeType}, $change',
      time: DateTime.now(),
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.i(
      'onTransition -- ${bloc.runtimeType}, $transition',
      time: DateTime.now(),
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.e(
      'onError -- ${bloc.runtimeType}, $error',
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.i(
      'onClose -- ${bloc.runtimeType}',
      time: DateTime.now(),
    );
  }
}
