import 'package:flutter/material.dart';

class QuizListItemComponent extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget leading;
  // final Color tileColor;

  const QuizListItemComponent({Key? key, required this.title, required this.subTitle, required this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      leading: leading,
      onTap: () => {},
      onLongPress: () => {}
    );
  }
}