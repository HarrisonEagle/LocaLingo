import 'package:freezed_annotation/freezed_annotation.dart';

// {ファイル名}.freezed.dart　と書く
part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
class Conversation with _$Conversation {
  const factory Conversation(
      {required String speaker, required String message}) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}
