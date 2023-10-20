import 'package:bloc/bloc.dart';
import 'package:flutter_application_test_public/main.dart';
import 'package:flutter_application_test_public/src/domain/models/select_item_model.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/dosage_of_prescription_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/frequency_of_prescription_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/unit_of_prescription_form_widget.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_event.dart';
part 'detail_state.dart';
part 'detail_bloc.freezed.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(const DetailStateInitial()) {
    on<DetailEvent>((events, emit) {
      events.map(
        started: (event) => _started(emit),
        onChangedName: (event) => _onChangedName(event, emit),
        onChangedQuantity: (event) => _onChangedQuantity(event, emit),
        onChangedUnit: (event) => _onChangedUnit(event, emit),
        onChangedFrequency: (event) => _onChangedFrequency(event, emit),
        onChangedDosage: (event) => _onChangedDosage(event, emit),
        onSavedPrescription: (event) => _onSavedPrescription(event, emit),
      );
    });
  }

  void _started(Emitter<DetailState> emit) {
    emit(
      DetailState.typing(
        unit: unitsOfPrescription.first,
        frequency: frequencyOfPrescription.first,
        dosage: dosageOfPrescription.first,
      ),
    );
  }

  void _onChangedName(ChangedName event, Emitter<DetailState> emit) {
    if (state is DetailStateTyping) {
      emit((state as DetailStateTyping).copyWith(name: event.name));
    }
  }

  void _onChangedQuantity(ChangedQuantity event, Emitter<DetailState> emit) {
    if (state is DetailStateTyping) {
      emit((state as DetailStateTyping).copyWith(quantity: event.quantity));
    }
  }

  void _onChangedUnit(ChangedUnit event, Emitter<DetailState> emit) {
    if (state is DetailStateTyping) {
      emit((state as DetailStateTyping).copyWith(unit: event.unit));
    }
  }

  void _onChangedFrequency(ChangedFrequency event, Emitter<DetailState> emit) {
    if (state is DetailStateTyping) {
      emit((state as DetailStateTyping).copyWith(frequency: event.frequency));
    }
  }

  void _onChangedDosage(ChangedDosage event, Emitter<DetailState> emit) {
    if (state is DetailStateTyping) {
      emit((state as DetailStateTyping).copyWith(dosage: event.dosage));
    }
  }

  void _onSavedPrescription(
      SavedPrescription event, Emitter<DetailState> emit) {
    logger.i(state);
  }
}
