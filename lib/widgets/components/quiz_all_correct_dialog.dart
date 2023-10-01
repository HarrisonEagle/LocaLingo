import 'package:flutter/material.dart';
import 'package:localingo/entities/question.dart';

class QuizAllCorrectDialog extends StatelessWidget {
  final Question question;
  final int score;

  const QuizAllCorrectDialog(
      {Key? key, required this.question, required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
        insetPadding: const EdgeInsets.fromLTRB(20, 250, 20, 370),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '🎉おめでとうございます！🎉',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '全',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      score.toString(),
                      style: const TextStyle(fontSize: 50, color: Colors.green),
                    ),
                    Text(
                      '問正解です！',
                      style: const TextStyle(fontSize: 20),
                    )
                  ],),),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
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
            ],),
        ),
    );
  }
}
