import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:localingo/enitity/answer.dart';
import 'package:localingo/enitity/conversation.dart';
import 'package:localingo/enitity/question.dart';
import 'package:localingo/ui_models/chat_element.dart';
import 'package:localingo/widgets/components/chat_header.dart';

import '../../services/chat_service.dart';
import '../components/chat_element_list_item.dart';

class ChatPage extends HookWidget {
  final String languageType;
  const ChatPage({super.key, required this.languageType});
  @override
  Widget build(BuildContext context) {
    final chatService = useChatService(languageType);
    final String imagePath =
        ModalRoute.of(context)!.settings.arguments as String;
    final List<ChatElement> chatElements = [
      const Conversation(speaker: "A", message: "こんばんは！今何時？"),
      const Question(
          question: "こんばんは！今何時？",
          answers: [
            Answer(answer: "こんばんは！今1時30分だよ！", correct: true),
            Answer(answer: "あいうえお", correct: false),
            Answer(answer: "かきくけこ", correct: false),
            Answer(answer: "最周世そあ", correct: false),
          ],
          explanation: "時間を答えています。"
      ),
      const Conversation(speaker: "B", message: "こんばんは！今1時30分だよ！"),
      const Conversation(speaker: "A", message: "こんばんは！今何時？"),
      const Question(
          question: "こんばんは！今何時？",
          answers: [
            Answer(answer: "こんばんは！今1時30分だよ！", correct: true),
            Answer(answer: "あいうえお", correct: false),
            Answer(answer: "かきくけこ", correct: false),
            Answer(answer: "最周世そあ", correct: false),
          ],
          explanation: "時間を答えています。"
      ),
      const Conversation(speaker: "B", message: "こんばんは！今1時30分だよ！"),
    ];

    useEffect(() {
      chatService.initConversation();
    }, []);
    return Scaffold(
      appBar: ChatHeader(languageType: languageType, score: chatService.score),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: ListView.builder(
                    itemCount: chatService.chats.length,
                    itemBuilder: (context, index) => ListTile(
                      textColor: Colors.black,
                      title: ChatElementListItemComponent(
                          imagePath: imagePath,
                          element: chatService.chats[index]),
                    ),
                  )),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
