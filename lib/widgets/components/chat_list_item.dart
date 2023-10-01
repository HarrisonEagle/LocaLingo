import 'package:flutter/material.dart';
import 'package:localingo/entities/conversation.dart';
import 'package:localingo/widgets/components/chat_list_item_a.dart';
import 'package:localingo/widgets/components/chat_list_item_b.dart';

class ChatListItemComponent extends StatelessWidget {
  final String imagePath;
  final Conversation conversation;

  const ChatListItemComponent(
      {Key? key, required this.imagePath, required this.conversation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (conversation.speaker == 'A') {
      return ChatListItemAComponent(
          imagePath: imagePath, conversation: conversation);
    } else {
      return ChatListItemBComponent(conversation: conversation);
    }
  }
}
