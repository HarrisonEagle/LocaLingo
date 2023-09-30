import 'package:flutter/material.dart';
import 'package:localingo/enitity/conversation.dart';

class ChatListItemAComponent extends StatelessWidget {
  final String imagePath;
  final Conversation conversation;

  const ChatListItemAComponent({Key? key, required this.imagePath, required this.conversation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: [
                  Image.network(imagePath)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Flexible(
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                    BoxShadow(
                    color: Color(0xffd6d6d6), //色
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(1, 1),
                    ),
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(conversation.message),
                    )
                  )
              )
            )
          ],
        )
    );
  }
}
