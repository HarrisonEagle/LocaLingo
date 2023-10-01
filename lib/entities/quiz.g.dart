// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizImpl _$$QuizImplFromJson(Map<String, dynamic> json) => _$QuizImpl(
      id: json['id'] as int,
      languageType: json['languageType'] as String,
      highscore: json['highscore'] as int,
      imagePath: json['imagePath'] as String,
    );

Map<String, dynamic> _$$QuizImplToJson(_$QuizImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'languageType': instance.languageType,
      'highscore': instance.highscore,
      'imagePath': instance.imagePath,
    };
