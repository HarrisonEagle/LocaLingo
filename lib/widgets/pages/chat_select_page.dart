import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localingo/entities/quiz.dart';
import 'package:localingo/widgets/components/common_header.dart';

import '../../viewmodels/win_score_viewmodel.dart';
import '../components/chat_start_dialog.dart';
import '../components/quiz_list_item.dart';
import 'dart:math';

class ChatSelectPage extends ConsumerWidget {
  ChatSelectPage({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final winScoreRef = ref.watch(winScoreProvider);

    // TODO: refactor and not use constant values
    final quizzes = [
      Quiz(
          id: 1,
          languageType: "関西弁",
          highscore: winScoreRef.getMaxWinScore("関西弁"),
          imagePath:
          "https://kotonohaworks.com/free-icons/wp-content/uploads/kkrn_icon_user_1.png"),
      Quiz(
          id: 2,
          languageType: "名古屋弁",
          highscore: winScoreRef.getMaxWinScore("名古屋弁"),
          imagePath:
          "https://kotonohaworks.com/free-icons/wp-content/uploads/kkrn_icon_user_1.png"),
      Quiz(
          id: 3,
          languageType: "鹿児島弁",
          highscore: winScoreRef.getMaxWinScore("鹿児島弁"),
          imagePath:
          "https://kotonohaworks.com/free-icons/wp-content/uploads/kkrn_icon_user_1.png"),
      Quiz(
          id: 4,
          languageType: "アイヌ語",
          highscore: winScoreRef.getMaxWinScore("アイヌ語"),
          imagePath:
          "https://kotonohaworks.com/free-icons/wp-content/uploads/kkrn_icon_user_1.png"),
      Quiz(
          id: 5,
          languageType: "津軽弁",
          highscore: winScoreRef.getMaxWinScore("津軽弁"),
          imagePath:
          "https://kotonohaworks.com/free-icons/wp-content/uploads/kkrn_icon_user_1.png"),
    ];
    return Scaffold(
      appBar: const CommonHeader(automaticallyImplyLeading: false),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/select.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
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
                  child: const Text('ランダム選択', style: TextStyle(fontSize: 20),),
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
