import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/language/LanguageCubit.dart';
import 'app_strings.dart';

String tr(BuildContext context, String key) {
  final lang = context.read<LanguageCubit>().state.locale.languageCode;
  return AppStrings.values[lang]?[key] ??
      AppStrings.values['en']![key]!;
}