import 'package:flutter/material.dart';

import '../../enitity/answer.dart';

class AnswerListItemComponent extends StatelessWidget {
  final Answer answer;
  final bool clickable;
  final String wrongAnswer;

  const AnswerListItemComponent(
      {Key? key,
      required this.answer,
      required this.clickable,
      required this.wrongAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: Container(
                  width: 190,
                  decoration: BoxDecoration(
                      color: clickable
                          ? (wrongAnswer == ''
                              ? Colors.white
                              : answer.answer == wrongAnswer
                                  ? Colors.red
                                  : const Color(0xffe6e6e6))
                          : (answer.correct
                              ? const Color(0x997cfc00)
                              : const Color(0xffe6e6e6)),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xffe6e6e6), //色
                          spreadRadius: 4,
                          blurRadius: 5,
                          offset: Offset(1, 1),
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: Text(
                      answer.answer,
                    ),
                  ),
                ))
          ],
        ));
  }
}
