import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../services/chat_service.dart';

class ChatPage extends HookWidget{

  final String languageType;
  const ChatPage({super.key, required this.languageType});
  @override
  Widget build(BuildContext context) {
    final chatService = useChatService(languageType);

    useEffect((){
      chatService.initConversation();
    }, []);
    return Scaffold(
      appBar: AppBar(title: Text('Simple Chat')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: chatService.chats.length,
                itemBuilder: (context, index) => ListTile(
                  textColor: Colors.black,
                  title: Text(chatService.chats[index].message),
                ),
              ),
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}