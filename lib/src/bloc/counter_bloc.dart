import 'package:bloc/bloc.dart';
import 'package:flutter_application_test_public/src/bloc/counter_event.dart';
import 'package:flutter_application_test_public/src/domain/repositories/counter_repository.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  final CounterRepository counterRepository;

  CounterBloc(this.counterRepository) : super(0) {
    on<CounterIncrementPressed>((event, emit) {
      final int newValue = counterRepository.getIncrement();
      emit(state + newValue);
    });
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  @override
  Future<void> close() {
    // dispose
    return super.close();
  }
}
