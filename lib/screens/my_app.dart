import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../cubit/language/LanguageCubit.dart';
import '../cubit/language/language_state.dart';
import '../cubit/theme/theme_cubit.dart';
import '../cubit/theme/theme_state.dart';
import 'login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, langState) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,

              locale: langState.locale,

              themeMode: themeState.themeMode,

              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),

              supportedLocales: const [
                Locale('en'),
                Locale('hi'),
              ],

              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],

              home: const LoginScreen(),
            );
          },
        );
      },
    );
  }
}
