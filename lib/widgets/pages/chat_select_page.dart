import 'package:flutter/material.dart';
import 'package:localingo/enitity/quiz.dart';
import 'package:localingo/widgets/components/common_header.dart';

import '../components/chat_start_dialog.dart';
import '../components/quiz_list_item.dart';
import 'dart:math';

class ChatSelectPage extends StatelessWidget {
  ChatSelectPage({super.key});
  final quizzes = [
    const Quiz(
        id: 1,
        languageType: "関西弁",
        highscore: 0,
        imagePath:
            "https://kotonohaworks.com/free-icons/wp-content/uploads/kkrn_icon_user_1.png"),
    const Quiz(
        id: 2,
        languageType: "名古屋弁",
        highscore: 0,
        imagePath:
            "https://kotonohaworks.com/free-icons/wp-content/uploads/kkrn_icon_user_1.png"),
    const Quiz(
        id: 3,
        languageType: "鹿児島弁",
        highscore: 0,
        imagePath:
            "https://kotonohaworks.com/free-icons/wp-content/uploads/kkrn_icon_user_1.png"),
    const Quiz(
        id: 4,
        languageType: "アイヌ語",
        highscore: 0,
        imagePath:
            "https://kotonohaworks.com/free-icons/wp-content/uploads/kkrn_icon_user_1.png"),
    const Quiz(
        id: 5,
        languageType: "津軽弁",
        highscore: 0,
        imagePath:
            "https://kotonohaworks.com/free-icons/wp-content/uploads/kkrn_icon_user_1.png"),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: const CommonHeader(automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
              child: SizedBox(
                height: 525,
                child: ListView.separated(
                  padding: const EdgeInsets.all(5),
                  itemBuilder: (BuildContext context, int index) {
                    return QuizListItemComponent(
                      quiz: quizzes[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: quizzes.length,
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  Quiz quiz = quizzes[Random().nextInt(quizzes.length)];
                  await showDialog(
                      context: context,
                      builder: (_) => ChatStartDialog(
                            id: quiz.id,
                            languageType: quiz.languageType,
                            imagePath: quiz.imagePath,
                          ));
                },
                child: const Text('Random'),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
