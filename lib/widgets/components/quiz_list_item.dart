import 'package:flutter/material.dart';
import 'package:localingo/utils/assets.dart';
import 'package:localingo/widgets/components/chat_start_dialog.dart';

import '../../entities/quiz.dart';

class QuizListItemComponent extends StatelessWidget {
  final Quiz quiz;

  const QuizListItemComponent({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 75,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffd6d6d6), //色
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(1, 1),
            ),
          ]),
      child: ListTile(
          title: Text(quiz.languageType),
          subtitle: Text('最高${quiz.highscore}回連続正解'),
          leading: CircleAvatar(
            radius: 35, // Image radius
            backgroundImage: Image.asset(assets[quiz.languageType]!["icon"]!, fit: BoxFit.fill).image,
          ),
          onTap: () async {
            await showDialog(
                context: context,
                builder: (_) => ChatStartDialog(
                      id: quiz.id,
                      languageType: quiz.languageType,
                      imagePath: quiz.imagePath,
                    ));
          },
          onLongPress: () => {}),
    );
  }
}
