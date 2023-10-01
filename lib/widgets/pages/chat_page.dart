import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:localingo/repositories/chat_repository.dart';
import 'package:localingo/utils/assets.dart';
import 'package:localingo/widgets/components/chat_header.dart';

import '../../viewmodels/chat_viewmodel.dart';
import '../components/chat_element_list_item.dart';

class ChatPage extends HookWidget {
  final String languageType;

  const ChatPage({super.key, required this.languageType});

  @override
  Widget build(BuildContext context) {
    final chatViewModel = useChatViewModel(languageType, ChatRepositoryImpl(languageType: languageType));

    useEffect(() {
      chatViewModel.initConversation();
    }, []);

    return Scaffold(
      appBar: ChatHeader(languageType: languageType, score: chatViewModel.score),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(assets[languageType]!["background"]!),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.1), BlendMode.dstATop),
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: ListView.builder(
                        reverse: true,
                        itemCount: chatViewModel.chats.length,
                        itemBuilder: (context, index) {
                          final reversedIndex =
                              chatViewModel.chats.length - 1 - index;
                          final element = chatViewModel.chats[reversedIndex];
                          return ListTile(
                            textColor: Colors.black,
                            title: ChatElementListItemComponent(
                                imagePath: assets[languageType]!["icon"]!,
                                element: element,
                                languageType: languageType,
                                clickable: index == 0,
                                chatViewModel: chatViewModel,
                                score: chatViewModel.score),
                          );
                        })),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
