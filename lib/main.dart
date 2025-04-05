import 'package:flutter/material.dart';
import 'package:triolingo/duolingo_splashscreen.dart';

void main() {
  runApp(const MyApp());
}

//this is new change
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DuolingoSplashScreen(),
    );
  }
}
