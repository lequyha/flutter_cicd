import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_item_model.freezed.dart';
part 'select_item_model.g.dart';

@freezed
class SelectItemModel with _$SelectItemModel {
  const factory SelectItemModel({
    required String label,
    required dynamic value,
  }) = _SelectItemModel;

  factory SelectItemModel.fromJson(Map<String, Object?> json) =>
      _$SelectItemModelFromJson(json);
}
