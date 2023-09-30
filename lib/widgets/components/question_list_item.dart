import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:localingo/widgets/components/quiz_all_correct_dialog.dart';
import 'package:localingo/widgets/components/quiz_failed_dialog.dart';

import '../../enitity/question.dart';
import 'answer_list_item.dart';

class QuestionListItemComponent extends HookWidget {
  final Question question;
  final String languageType;
  final bool Function() continueConversation;
  final bool clickable;
  final int score;

  QuestionListItemComponent(
      {Key? key,
      required this.question,
      required this.languageType,
      required this.continueConversation,
      required this.clickable,
      required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wrongAnswer = useState<String>("");
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  width: 225,
                  decoration: BoxDecoration(
                      color: const Color(0xfff0f8ff),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffe6e6e6), //色
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(1, 1),
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xfff0f8ff),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Center(
                            child: Text('Q. ${question.question}'),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: ListView.builder(
                              itemCount: question.answers.length,
                              itemBuilder: (context, index) => ListTile(
                                textColor: Colors.black,
                                title: AnswerListItemComponent(
                                  answer: question.answers[index],
                                  clickable: clickable,
                                  wrongAnswer: wrongAnswer.value,
                                ),
                                onTap: clickable
                                    ? () async {
                                        if (question.answers[index].correct) {
                                          if (!continueConversation()) {
                                            await showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    QuizAllCorrectDialog(
                                                      question: question,
                                                      score: score,
                                                    ));
                                          }
                                        } else {
                                          wrongAnswer.value =
                                              question.answers[index].answer;
                                          await showDialog(
                                              context: context,
                                              builder: (_) => QuizFailedDialog(
                                                    question: question,
                                                    score: score,
                                                  ));
                                        }
                                } : null,
                              ),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                          ))
                    ],
                  ),
                ))
          ],
        ));
  }
}
