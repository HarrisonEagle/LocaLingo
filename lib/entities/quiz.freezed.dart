// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return _Quiz.fromJson(json);
}

/// @nodoc
mixin _$Quiz {
  int get id => throw _privateConstructorUsedError;
  String get languageType => throw _privateConstructorUsedError;
  int get highscore => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res, Quiz>;
  @useResult
  $Res call({int id, String languageType, int highscore, String imagePath});
}

/// @nodoc
class _$QuizCopyWithImpl<$Res, $Val extends Quiz>
    implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? languageType = null,
    Object? highscore = null,
    Object? imagePath = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      languageType: null == languageType
          ? _value.languageType
          : languageType // ignore: cast_nullable_to_non_nullable
              as String,
      highscore: null == highscore
          ? _value.highscore
          : highscore // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizImplCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$$QuizImplCopyWith(
          _$QuizImpl value, $Res Function(_$QuizImpl) then) =
      __$$QuizImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String languageType, int highscore, String imagePath});
}

/// @nodoc
class __$$QuizImplCopyWithImpl<$Res>
    extends _$QuizCopyWithImpl<$Res, _$QuizImpl>
    implements _$$QuizImplCopyWith<$Res> {
  __$$QuizImplCopyWithImpl(_$QuizImpl _value, $Res Function(_$QuizImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? languageType = null,
    Object? highscore = null,
    Object? imagePath = null,
  }) {
    return _then(_$QuizImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      languageType: null == languageType
          ? _value.languageType
          : languageType // ignore: cast_nullable_to_non_nullable
              as String,
      highscore: null == highscore
          ? _value.highscore
          : highscore // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizImpl implements _Quiz {
  const _$QuizImpl(
      {required this.id,
      required this.languageType,
      required this.highscore,
      required this.imagePath});

  factory _$QuizImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizImplFromJson(json);

  @override
  final int id;
  @override
  final String languageType;
  @override
  final int highscore;
  @override
  final String imagePath;

  @override
  String toString() {
    return 'Quiz(id: $id, languageType: $languageType, highscore: $highscore, imagePath: $imagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.languageType, languageType) ||
                other.languageType == languageType) &&
            (identical(other.highscore, highscore) ||
                other.highscore == highscore) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, languageType, highscore, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      __$$QuizImplCopyWithImpl<_$QuizImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizImplToJson(
      this,
    );
  }
}

abstract class _Quiz implements Quiz {
  const factory _Quiz(
      {required final int id,
      required final String languageType,
      required final int highscore,
      required final String imagePath}) = _$QuizImpl;

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$QuizImpl.fromJson;

  @override
  int get id;
  @override
  String get languageType;
  @override
  int get highscore;
  @override
  String get imagePath;
  @override
  @JsonKey(ignore: true)
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
