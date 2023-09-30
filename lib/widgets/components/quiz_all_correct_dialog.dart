import 'package:flutter/material.dart';
import 'package:localingo/enitity/question.dart';

class QuizAllCorrectDialog extends StatelessWidget {
  final Question question;
  final int score;

  const QuizAllCorrectDialog(
      {Key? key, required this.question, required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('おめでとうございます！\n全問正解です！'),
      actions: <Widget>[
        GestureDetector(
          child: const Text(
            'はい',
            style: TextStyle(color: Colors.lightBlueAccent),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
