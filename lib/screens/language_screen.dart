import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/language/LanguageCubit.dart';
import '../cubit/theme/theme_cubit.dart';
import '../localization/translator.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLang =
        context.watch<LanguageCubit>().state.locale.languageCode;

    return Scaffold(
      appBar: AppBar(
        title: Text(tr(context, 'change_language')),
      ),
      body: ListView(
        children: [
          RadioListTile<String>(
            title: Text(tr(context, 'english')),
            value: 'en',
            groupValue: currentLang,
            onChanged: (value) {
              context.read<LanguageCubit>().changeLanguage(value!);
            },
          ),
          RadioListTile<String>(
            title: Text(tr(context, 'hindi')),
            value: 'hi',
            groupValue: currentLang,
            onChanged: (value) {
              context.read<LanguageCubit>().changeLanguage(value!);
            },
          ),
          SwitchListTile(
            title: Text(tr(context, 'dark_mode')),
            value: context.watch<ThemeCubit>().state.themeMode == ThemeMode.dark,
            onChanged: (value) {
              context.read<ThemeCubit>().toggleTheme(value);
            },
          ),
        ],
      ),
    );
  }
}