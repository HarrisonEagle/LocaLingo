import 'package:flutter/material.dart';

import '../../utils/assets.dart';

class ChatStartDialog extends StatelessWidget {
  final int id;
  final String languageType;
  final String imagePath;

  const ChatStartDialog(
      {Key? key,
      required this.id,
      required this.languageType,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      insetPadding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 220.0),
      child: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          CircleAvatar(
          radius: 60, // Image radius
          backgroundImage: Image.asset(assets[languageType]!["icon"]!, fit: BoxFit.fill).image,
        ),
          const SizedBox(
            height: 20,
          ),
          Text(
              '$languageTypeで始めます！',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Text(
            'よろしいですか？',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15.0), child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              minimumSize: const Size.fromHeight(50),
              elevation: 1,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                )
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed("/chats/$languageType", arguments: imagePath);
            },
            child: const Text('はじめる', style: TextStyle(
              fontSize: 20,
            ),),
          ),),
          Padding(padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15.0), child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.red,
              backgroundColor: Colors.white,
              minimumSize: const Size.fromHeight(50),
              elevation: 0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('キャンセル', style: TextStyle(
              fontSize: 15,
            ),),
          ),)
        ]
        )
      ),
      // content: Text(
      //   '$languageTypeで始めます！',
      //   style: const TextStyle(fontSize: 20),
      // ),
      // actions: <Widget>[
      //   GestureDetector(
      //     child: const Text(
      //       'キャンセル',
      //       style: TextStyle(
      //         color: Colors.grey,
      //         fontSize: 16,
      //       ),
      //     ),
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   GestureDetector(
      //     child: const Text(
      //       'はい',
      //       style: TextStyle(
      //         color: Colors.lightBlueAccent,
      //         fontSize: 16,
      //       ),
      //     ),
      //     onTap: () {
      //       Navigator.pop(context);
      //       Navigator.of(context)
      //           .pushNamed("/chats/$languageType", arguments: imagePath);
      //     },
      //   )
      // ],
    );
  }
}
