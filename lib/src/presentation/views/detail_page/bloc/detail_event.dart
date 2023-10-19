part of 'detail_bloc.dart';

@freezed
class DetailEvent with _$DetailEvent {
  const factory DetailEvent.started() = _Started;

  const factory DetailEvent.onChangedName({String? name}) = ChangedName;

  const factory DetailEvent.onChangedQuantity({int? quantity}) =
      ChangedQuantity;

  const factory DetailEvent.onChangedUnit({SelectItemModel? unit}) =
      ChangedUnit;

  const factory DetailEvent.onChangedFrequency({SelectItemModel? frequency}) =
      ChangedFrequency;

  const factory DetailEvent.onChangedDosage({SelectItemModel? dosage}) =
      ChangedDosage;

  const factory DetailEvent.onSavedPrescription() = SavedPrescription;
}
