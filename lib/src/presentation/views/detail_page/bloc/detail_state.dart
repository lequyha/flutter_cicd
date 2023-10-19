part of 'detail_bloc.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState.initial() = DetailStateInitial;

  const factory DetailState.typing({
    String? name,
    int? quantity,
    SelectItemModel? unit,
    SelectItemModel? frequency,
    SelectItemModel? dosage,
  }) = DetailStateTyping;

  const factory DetailState.success() = DetailStateSuccess;
}
