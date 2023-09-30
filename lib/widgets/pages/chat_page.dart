import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:localingo/widgets/components/chat_header.dart';
import 'package:localingo/widgets/components/chat_list_item_a.dart';

import '../../services/chat_service.dart';

class ChatPage extends HookWidget {
  final String languageType;
  const ChatPage({super.key, required this.languageType});
  @override
  Widget build(BuildContext context) {
    final chatService = useChatService(languageType);
    final String imagePath = ModalRoute.of(context)!.settings.arguments as String;

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
              child: ListView.builder(
                itemCount: chatService.chats.length,
                itemBuilder: (context, index) => ListTile(
                  textColor: Colors.black,
                  title: ChatListItemAComponent(
                      imagePath: imagePath,
                      conversation: chatService.chats[index]
                  ),
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
