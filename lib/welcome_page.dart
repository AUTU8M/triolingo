import 'package:flutter/material.dart';
import 'package:triolingo/features/onboarding/view/login_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginPage());
  }
}
