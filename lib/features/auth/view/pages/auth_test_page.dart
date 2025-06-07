import 'package:flutter/material.dart';

class AuthTestPage extends StatelessWidget {
  const AuthTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Test Page'),
      ),
      body: const Center(
        child: Text(
          'You are signed in!\nWelcome to the protected area.',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
