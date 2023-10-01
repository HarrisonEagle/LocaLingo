import 'package:flutter/material.dart';
import 'package:localingo/enitity/answer.dart';
import 'package:localingo/enitity/question.dart';

class QuizFailedDialog extends StatelessWidget {
  final Question question;
  final int score;

  const QuizFailedDialog(
      {Key? key, required this.question, required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
            insetPadding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 140.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              '残念！😰',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('正解は:', style: const TextStyle(fontSize: 20))),
            Text(
              '「${question.answers.where((Answer answer) => answer.correct).toList()[0].answer}」',
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w900, color: Colors.green),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Text('でした...', style: const TextStyle(fontSize: 20))),
            const SizedBox(
              height: 30,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('あなたの正答数は:', style: const TextStyle(fontSize: 20))),
            Text(
              score.toString(),
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w900, color: Colors.red),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Text('でした。', style: const TextStyle(fontSize: 20))),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.lightBlueAccent,
                backgroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
                elevation: 0,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                '戻る',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ]),
        ));
  }
}
