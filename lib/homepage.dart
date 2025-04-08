import 'package:flutter/material.dart';
import 'package:triolingo/pages/login_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginPage());
  }
}
