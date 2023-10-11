// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SelectItemModel _$SelectItemModelFromJson(Map<String, dynamic> json) {
  return _SelectItemModel.fromJson(json);
}

/// @nodoc
mixin _$SelectItemModel {
  String get label => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectItemModelCopyWith<SelectItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectItemModelCopyWith<$Res> {
  factory $SelectItemModelCopyWith(
          SelectItemModel value, $Res Function(SelectItemModel) then) =
      _$SelectItemModelCopyWithImpl<$Res, SelectItemModel>;
  @useResult
  $Res call({String label, dynamic value});
}

/// @nodoc
class _$SelectItemModelCopyWithImpl<$Res, $Val extends SelectItemModel>
    implements $SelectItemModelCopyWith<$Res> {
  _$SelectItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectItemModelImplCopyWith<$Res>
    implements $SelectItemModelCopyWith<$Res> {
  factory _$$SelectItemModelImplCopyWith(_$SelectItemModelImpl value,
          $Res Function(_$SelectItemModelImpl) then) =
      __$$SelectItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, dynamic value});
}

/// @nodoc
class __$$SelectItemModelImplCopyWithImpl<$Res>
    extends _$SelectItemModelCopyWithImpl<$Res, _$SelectItemModelImpl>
    implements _$$SelectItemModelImplCopyWith<$Res> {
  __$$SelectItemModelImplCopyWithImpl(
      _$SelectItemModelImpl _value, $Res Function(_$SelectItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = freezed,
  }) {
    return _then(_$SelectItemModelImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectItemModelImpl implements _SelectItemModel {
  const _$SelectItemModelImpl({required this.label, required this.value});

  factory _$SelectItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectItemModelImplFromJson(json);

  @override
  final String label;
  @override
  final dynamic value;

  @override
  String toString() {
    return 'SelectItemModel(label: $label, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectItemModelImpl &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, label, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectItemModelImplCopyWith<_$SelectItemModelImpl> get copyWith =>
      __$$SelectItemModelImplCopyWithImpl<_$SelectItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectItemModelImplToJson(
      this,
    );
  }
}

abstract class _SelectItemModel implements SelectItemModel {
  const factory _SelectItemModel(
      {required final String label,
      required final dynamic value}) = _$SelectItemModelImpl;

  factory _SelectItemModel.fromJson(Map<String, dynamic> json) =
      _$SelectItemModelImpl.fromJson;

  @override
  String get label;
  @override
  dynamic get value;
  @override
  @JsonKey(ignore: true)
  _$$SelectItemModelImplCopyWith<_$SelectItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
