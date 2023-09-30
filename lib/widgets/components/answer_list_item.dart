import 'package:flutter/material.dart';

import '../../enitity/answer.dart';

class AnswerListItemComponent extends StatelessWidget {
  final Answer answer;

  const AnswerListItemComponent({Key? key, required this.answer})
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
                      color: Colors.white,
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
