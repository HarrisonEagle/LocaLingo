import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localingo/widgets/router.dart';

Future main() async{
  await dotenv.load(fileName: '.env');
  final openApiKey = dotenv.env['OPEN_AI_API_KEY'];
  if(openApiKey != null){
    OpenAI.apiKey = openApiKey;
  }else{
    throw Exception(["open api key is not setted!"]);
  }

  runApp(const ProviderScope(
    child: AppRouter(),
  ));
}