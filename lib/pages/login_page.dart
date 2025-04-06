import 'package:flutter/material.dart';
import 'package:triolingo/pages/iAm_duo.dart';
import 'package:triolingo/widgets/duolingo_logo.dart';
import 'package:triolingo/widgets/outlinedtypa_button.dart';
import 'package:triolingo/widgets/primary_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DuolingoLogo(),
                    SizedBox(height: 20),
                    WelcomeText(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  PrimaryButton(
                    text: 'GET STARTED',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const IamDuo()),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  OutlinedtypaButton(
                    text: 'I ALREADY HAVE AN ACCOUNT',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'The free, fun, and effective way to learn a \nlanguage!',
      textAlign: TextAlign.center,
      style: TextStyle(color: Color.fromRGBO(123, 145, 155, 1), fontSize: 16),
    );
  }
}
