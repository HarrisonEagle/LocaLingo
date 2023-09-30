import 'package:flutter/material.dart';
import 'package:localingo/widgets/components/chat_start_dialog.dart';

class QuizListItemComponent extends StatelessWidget {
  final int id;
  final String title;
  final String subTitle;
  final Widget leading;

  const QuizListItemComponent(
      {Key? key,
      required this.id,
      required this.title,
      required this.subTitle,
      required this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 85,
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
          title: Text(title),
          subtitle: Text(subTitle),
          leading: leading,
          onTap: () async {
            await showDialog(
                context: context,
                builder: (_) => ChatStartDialog(id: id, name: title));
          },
          onLongPress: () => {}),
    );
  }
}