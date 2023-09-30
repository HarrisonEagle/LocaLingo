import 'package:flutter/material.dart';

class ChatStartDialog extends StatelessWidget {
  final int id;
  final String name;

  const ChatStartDialog({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('$nameで始めます！'),
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
          onTap: () {},
        )
      ],
    );
  }
}
