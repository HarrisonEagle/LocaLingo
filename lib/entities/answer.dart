import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

@freezed
class Answer with _$Answer {
  const factory Answer({required String answer, required bool correct}) =
      _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
