import 'package:flutter/material.dart';

class ChatStartDialog extends StatelessWidget {
  final int id;
  final String languageType;

  const ChatStartDialog({Key? key, required this.id, required this.languageType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('$languageTypeで始めます！'),
      actions: <Widget>[
        GestureDetector(
          child: const Text(
            'キャンセル',
            style: TextStyle(color: Colors.grey),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        GestureDetector(
          child: const Text(
            'はい',
            style: TextStyle(color: Colors.lightBlueAccent),
          ),
          onTap: () {
            Navigator.of(context).pushNamed("/chats/$languageType");
          },
        )
      ],
    );
  }
}
