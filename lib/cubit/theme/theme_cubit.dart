import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themeKey = 'theme_mode';
  ThemeCubit() : super(ThemeState(ThemeMode.light)) {
    loadTheme();
  }
  Future<void> toggleTheme(bool isDark) async {
    final theme = isDark ? ThemeMode.dark : ThemeMode.light;
    emit(ThemeState(theme));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_themeKey) ?? false;
    emit(ThemeState(isDark ? ThemeMode.dark : ThemeMode.light));
  }
}
