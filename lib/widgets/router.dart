import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localingo/widgets/pages/chat_page.dart';
import 'package:localingo/widgets/pages/dialect_select_page.dart';
import 'package:localingo/widgets/pages/main_page.dart';

class AppRouter extends ConsumerWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'LocalLingo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: '/chat',
      routes: <String, WidgetBuilder> {
        '/main': (BuildContext context) => const MainPage(),
        '/chat': (BuildContext context) => const ChatPage(languageType: "関西弁"),
        '/dialects': (BuildContext context) => const DialectSelectPage(),
      },
    );
  }
}