import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localingo/widgets/pages/main_page.dart';
import 'package:localingo/widgets/router.dart';

Future main() async{
  await dotenv.load(fileName: '.env');
  //dotenv.env['OPEN_AI_API_KEY'])

  runApp(const ProviderScope(
    child: AppRouter(),
  ));
}