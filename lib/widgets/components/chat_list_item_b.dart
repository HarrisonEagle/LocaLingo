import 'package:flutter/material.dart';
import 'package:localingo/enitity/conversation.dart';

class ChatListItemBComponent extends StatelessWidget {
  final Conversation conversation;

  const ChatListItemBComponent({Key? key, required this.conversation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Container(
                    width: 225,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffe6e6e6), //色
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 1),
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        conversation.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )))
          ],
        ));
  }
}
