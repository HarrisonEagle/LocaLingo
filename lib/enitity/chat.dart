import 'package:freezed_annotation/freezed_annotation.dart';
import 'conversation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({required List<Conversation> conversations, required int score}) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
