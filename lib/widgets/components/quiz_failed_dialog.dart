import 'package:flutter/material.dart';
import 'package:localingo/enitity/answer.dart';
import 'package:localingo/enitity/question.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class QuizFailedDialog extends StatelessWidget {
  final Question question;
  final int score;

  const QuizFailedDialog(
      {Key? key, required this.question, required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        '残念！\n正解は「${question.answers.where((Answer answer) => answer.correct).toList()[0].answer}」です！\nあなたの正当数は$scoreでした。',
        style: const TextStyle(fontSize: 20),
      ),
      actions: <Widget>[
        GestureDetector(
          child: const Icon(FontAwesomeIcons.twitter),
          onTap: () async {
            String text =
                '#Localingo\n残念！\n正解は「${question.answers.where((Answer answer) => answer.correct).toList()[0].answer}」です！\nあなたの正当数は$scoreでした。';

            await launchUrl(
                Uri.https('twitter.com', '/intent/tweet', {'text': text}),
                mode: LaunchMode.externalApplication);
          },
        ),
        GestureDetector(
          child: const Text(
            'はい',
            style: TextStyle(color: Colors.lightBlueAccent, fontSize: 16),
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
