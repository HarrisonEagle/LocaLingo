import 'package:freezed_annotation/freezed_annotation.dart';

// {ファイル名}.freezed.dart　と書く
part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz(
      {required int id, required String languageType, required int highscore, required String imagePath}) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) =>_$QuizFromJson(json);
}