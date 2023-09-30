import 'package:freezed_annotation/freezed_annotation.dart';
import 'answer.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  const factory Question({required String question, required List<Answer> answers, required String explanation}) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}
