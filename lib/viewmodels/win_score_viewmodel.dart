
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((_) => throw UnimplementedError());

final winScoreProvider = Provider<WinScoreUtility>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return WinScoreUtility(sharedPreferences: sharedPrefs);
});

class WinScoreUtility {
  WinScoreUtility({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  int getMaxWinScore(String languageType) {
    return sharedPreferences.getInt(languageType) ?? 0;
  }

  void setWinScore(String languageType, int newVal) {
    sharedPreferences.setInt(languageType, max(getMaxWinScore(languageType), newVal));
  }
}