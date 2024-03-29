import 'package:flutter/material.dart';
import 'package:localingo/entities/conversation.dart';
import 'package:localingo/entities/question.dart';
import 'package:localingo/widgets/components/question_list_item.dart';

import '../../entities/chat_element.dart';
import '../../viewmodels/chat_viewmodel.dart';
import 'chat_list_item.dart';

class ChatElementListItemComponent extends StatelessWidget {
  final String imagePath;
  final ChatElement element;
  final String languageType;
  final ChatViewModel chatViewModel;
  final bool clickable;
  final int score;

  const ChatElementListItemComponent(
      {Key? key,
      required this.imagePath,
      required this.element,
      required this.languageType,
      required this.chatViewModel,
      required this.clickable,
      required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (element.runtimeType.toString().contains('Conversation')) {
      return ChatListItemComponent(
          imagePath: imagePath, conversation: element as Conversation);
    } else {
      return QuestionListItemComponent(
          question: element as Question,
          languageType: languageType,
          chatViewModel: chatViewModel,
          clickable: clickable,
          score: score);
    }
  }
}
