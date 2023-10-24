import 'package:bloc/bloc.dart';
import 'package:flutter_application_test_public/src/core/loading_manager.dart';
import 'package:flutter_application_test_public/src/domain/models/select_item_model.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/dosage_drop_down.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/frequency_drop_down.dart';
import 'package:flutter_application_test_public/src/presentation/views/detail_page/widgets/unit_drop_down.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_event.dart';
part 'detail_state.dart';
part 'detail_bloc.freezed.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final LoadingManager _loadingManager;

  DetailBloc(this._loadingManager) : super(const DetailStateInitial()) {
    on<Started>(_started);
    on<ChangedName>(_onChangedName);
    on<ChangedTotalQuantity>(_onChangedTotalQuantity);
    on<ChangedUnit>(_onChangedUnit);
    on<ChangedFrequency>(_onChangedFrequency);
    on<ChangedDosage>(_onChangedDosage);
    on<SavedPrescription>(_onSavedPrescription);
  }

  Future<void> _started(
    Started event,
    Emitter<DetailState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1), () {});
    emit(
      DetailStateTyping(
        unit: unitsOfPrescription.first,
        frequency: frequencyOfPrescription.first,
        dosage: dosageOfPrescription.first,
      ),
    );
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

  Future<void> _onChangedTotalQuantity(
    ChangedTotalQuantity event,
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
