import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localingo/viewmodels/win_score_viewmodel.dart';
import 'package:localingo/widgets/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  final openApiKey = dotenv.env['OPEN_AI_API_KEY'];
  if (openApiKey != null) {
    OpenAI.apiKey = openApiKey;
  } else {
    throw Exception(["open api key is not setted!"]);
  }

  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(
        // ここでインスタンス化し、Providerの値を上書きします
        await SharedPreferences.getInstance(),
      ),
    ],
    child: AppRouter(),
  ));
}
