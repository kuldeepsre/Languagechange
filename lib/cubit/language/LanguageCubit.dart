import 'dart:ui';

import 'package:bloc/bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  static const String _languageKey = 'selected_language';

  LanguageCubit() : super(LanguageState(const Locale('en'))) {
    loadSavedLanguage();
  }

  /// Change language & save locally
  Future<void> changeLanguage(String code) async {
    emit(LanguageState(Locale(code)));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, code);
  }

  /// Load saved language on app start
  Future<void> loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString(_languageKey) ?? 'en';

    emit(LanguageState(Locale(savedLang)));
  }
}