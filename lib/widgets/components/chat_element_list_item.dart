import 'package:flutter/material.dart';
import 'package:localingo/enitity/conversation.dart';
import 'package:localingo/widgets/components/chat_list_item_a.dart';
import 'package:localingo/widgets/components/chat_list_item_b.dart';

import '../../ui_models/chat_element.dart';
import 'chat_list_item.dart';

class ChatElementListItemComponent extends StatelessWidget {
  final String imagePath;
  final ChatElement element;

  const ChatElementListItemComponent(
      {Key? key, required this.imagePath, required this.element})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (element.runtimeType.toString().contains('Conversation')) {
      return ChatListItemComponent(
          imagePath: imagePath, conversation: element as Conversation);
    } else {
      return const Text("question");
    }
  }
}
