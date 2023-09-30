import 'package:flutter/material.dart';
import 'package:localingo/widgets/components/header.dart';

import '../components/quiz_list_item.dart';

class DialectSelectPage extends StatelessWidget {
  const DialectSelectPage({super.key});
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: const Header(automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 350,
                child: ListView.separated(
                  padding: const EdgeInsets.all(5),
                  itemBuilder: (BuildContext context, int index) {
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
                          ]
                      ),
                      child: QuizListItemComponent(
                          title: "関西弁",
                          subTitle: "最高6回連続",
                          leading: Image.network("https://kotonohaworks.com/free-icons/wp-content/uploads/kkrn_icon_user_1.png")
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: 3,
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
                onPressed: () {},
                child: const Text('Random'),
              ),
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
