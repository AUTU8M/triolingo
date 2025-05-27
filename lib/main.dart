import 'package:flutter/material.dart';
import 'package:triolingo/core/theme/theme.dart';

import 'package:triolingo/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Duolingo Clone',
      theme: AppTheme.darkThemeMode,

      home: Homepage(),
    );
  }
}
