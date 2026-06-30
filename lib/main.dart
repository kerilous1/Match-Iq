import 'package:flutter/material.dart';
import 'package:match_iq/core/utils/theme/app_theme.dart';
import 'package:match_iq/presentation/screens/home_screen.dart';

void main() {
  runApp(const MatchIqApp());
}

class MatchIqApp extends StatelessWidget {
  const MatchIqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Match-Iq',
      theme: AppTheme.lightTheme,
      home: const HomeView(),
    );
  }
}