// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  String get question => throw _privateConstructorUsedError;
  List<Answer> get answers => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call({String question, List<Answer> answers, String explanation});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answers = null,
    Object? explanation = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
          _$QuestionImpl value, $Res Function(_$QuestionImpl) then) =
      __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, List<Answer> answers, String explanation});
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
      _$QuestionImpl _value, $Res Function(_$QuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answers = null,
    Object? explanation = null,
  }) {
    return _then(_$QuestionImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl implements _Question {
  const _$QuestionImpl(
      {required this.question,
      required final List<Answer> answers,
      required this.explanation})
      : _answers = answers;

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  final String question;
  final List<Answer> _answers;
  @override
  List<Answer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final String explanation;

  @override
  String toString() {
    return 'Question(question: $question, answers: $answers, explanation: $explanation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, question,
      const DeepCollectionEquality().hash(_answers), explanation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  const factory _Question(
      {required final String question,
      required final List<Answer> answers,
      required final String explanation}) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  String get question;
  @override
  List<Answer> get answers;
  @override
  String get explanation;
  @override
  @JsonKey(ignore: true)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
