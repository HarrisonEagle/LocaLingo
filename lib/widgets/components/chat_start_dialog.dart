import 'package:flutter/material.dart';

class ChatStartDialog extends StatelessWidget {
  final int id;
  final String languageType;
  final String imagePath;

  const ChatStartDialog(
      {Key? key, required this.id, required this.languageType, required this.imagePath})
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
            Navigator.pop(context);
            Navigator.of(context).pushNamed("/chats/$languageType", arguments: imagePath);
          },
        )
      ],
    );
  }
}
