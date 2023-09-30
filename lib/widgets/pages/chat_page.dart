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
                      reverse: true,
                      itemCount: chatService.chats.length,
                      itemBuilder: (context, index) {
                        final reversedIndex =
                            chatService.chats.length - 1 - index;
                        final element = chatService.chats[reversedIndex];
                        return ListTile(
                          textColor: Colors.black,
                          title: ChatElementListItemComponent(
                              imagePath: imagePath,
                              element: element,
                              languageType: languageType,
                              clickable: index == 0,
                              continueConversation:
                                  chatService.continueConversation,
                              score: chatService.score),
                        );
                      })),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
