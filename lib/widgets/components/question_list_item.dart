import 'package:flutter/material.dart';

import '../../enitity/question.dart';
import 'answer_list_item.dart';

class QuestionListItemComponent extends StatelessWidget {
  final Question question;
  final String languageType;

  const QuestionListItemComponent(
      {Key? key, required this.question, required this.languageType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      color: Color(0xfff0f8ff),
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
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Center(
                            child: Text('Q. $languageTypeで返答しよう！'),
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
                                    answer: question.answers[index]),
                                onTap: () {
                                  if (question.answers[index].correct) {
                                  } else {}
                                },
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
