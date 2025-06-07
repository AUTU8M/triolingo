import 'package:flutter/material.dart';
import 'package:triolingo/core/theme/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:triolingo/secrets.dart';

import 'package:triolingo/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
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
