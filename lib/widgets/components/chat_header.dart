import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  const ChatHeader(
      {super.key, required this.languageType, required this.score});
  final String languageType;
  final int score;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text('$languageTypeテスト'),
        centerTitle: false,
        automaticallyImplyLeading: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [Text("$score回連続正解中")],
            ),
          )
        ]);
  }
}
