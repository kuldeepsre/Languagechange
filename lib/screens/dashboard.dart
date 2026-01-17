import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';
import '../localization/translator.dart';
import 'language_screen.dart';
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr(context, 'dashboard')),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LanguageScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthCubit>().logout();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("Welcome to Dashboard"),
      ),
    );
  }
}
