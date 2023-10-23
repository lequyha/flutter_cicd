import 'package:bloc/bloc.dart';
import 'package:flutter_application_test_public/src/core/loading_manager.dart';
import 'package:flutter_application_test_public/src/domain/models/select_item_model.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/dosage_of_prescription_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/frequency_of_prescription_form_widget.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/unit_of_prescription_form_widget.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_event.dart';
part 'detail_state.dart';
part 'detail_bloc.freezed.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final LoadingManager _loadingManager;

  DetailBloc(this._loadingManager) : super(const DetailStateInitial()) {
    on<DetailEvent>(
      (events, emit) async {
        await events.map(
          started: (event) async => await _started(emit),
          onChangedName: (event) async => await _onChangedName(event, emit),
          onChangedQuantity: (event) async =>
              await _onChangedQuantity(event, emit),
          onChangedUnit: (event) async => await _onChangedUnit(event, emit),
          onChangedFrequency: (event) async =>
              await _onChangedFrequency(event, emit),
          onChangedDosage: (event) async => await _onChangedDosage(event, emit),
          onSavedPrescription: (event) async =>
              await _onSavedPrescription(event, emit),
        );
      },
    );
  }

  Future<void> _started(Emitter<DetailState> emit) async {
    _showLoadingDialog();
    await Future.delayed(const Duration(seconds: 1), () {});
    emit(
      DetailStateTyping(
        unit: unitsOfPrescription.first,
        frequency: frequencyOfPrescription.first,
        dosage: dosageOfPrescription.first,
      ),
    );
    _hideLoadingDialog();
  }

  void _showLoadingDialog() => _loadingManager.showLoading();

  void _hideLoadingDialog() => _loadingManager.hideLoading();

  Future<void> _onChangedName(
    ChangedName event,
    Emitter<DetailState> emit,
  ) async {
    if (state is DetailStateTyping) {
      emit(
        (state as DetailStateTyping).copyWith(name: event.name),
      );
    }
  }

  Future<void> _onChangedQuantity(
    ChangedQuantity event,
    Emitter<DetailState> emit,
  ) async {
    if (state is DetailStateTyping) {
      emit(
        (state as DetailStateTyping).copyWith(quantity: event.quantity),
      );
    }
  }

  Future<void> _onChangedUnit(
    ChangedUnit event,
    Emitter<DetailState> emit,
  ) async {
    if (state is DetailStateTyping) {
      emit(
        (state as DetailStateTyping).copyWith(unit: event.unit),
      );
    }
  }

  Future<void> _onChangedFrequency(
    ChangedFrequency event,
    Emitter<DetailState> emit,
  ) async {
    if (state is DetailStateTyping) {
      emit(
        (state as DetailStateTyping).copyWith(frequency: event.frequency),
      );
    }
  }

  Future<void> _onChangedDosage(
    ChangedDosage event,
    Emitter<DetailState> emit,
  ) async {
    if (state is DetailStateTyping) {
      emit(
        (state as DetailStateTyping).copyWith(dosage: event.dosage),
      );
    }
  }

  Future<void> _onSavedPrescription(
      SavedPrescription event, Emitter<DetailState> emit) async {
    _showLoadingDialog();
    await Future.delayed(const Duration(seconds: 5), () {});
    emit(DetailStateSuccess());
    _hideLoadingDialog();
  }
}
