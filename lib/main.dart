import 'package:demo/repo/auth_repository.dart';
import 'package:demo/screens/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/auth_cubit.dart';
import 'cubit/dashboard/dashboard_cubit.dart';
import 'cubit/language/LanguageCubit.dart';
import 'cubit/theme/theme_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(AuthRepository()),
        ),
        BlocProvider(
          create: (_) => DashboardCubit(),
        ),
        BlocProvider(
          create: (_) => LanguageCubit(),
        ),
        BlocProvider(create: (_) => ThemeCubit()),

      ],
      child: MyApp(),
    ),
  );
}
