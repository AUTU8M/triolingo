import 'package:flutter/material.dart';
import 'package:triolingo/features/auth/view/pages/signin_page.dart';
import 'package:triolingo/features/auth/view/pages/signup_page.dart';
import 'package:triolingo/features/onboarding/view/pages/landing/i_am_duo.dart';
import 'core/theme/pallete.dart';
import 'package:triolingo/features/onboarding/view/widgets/duolingo_logo.dart';
import 'package:triolingo/features/onboarding/view/widgets/outlinedtypa_button.dart';
import 'package:triolingo/features/onboarding/view/widgets/primary_button.dart';

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
                    DuolingoLogo(
                      assetPath: 'assets/images/duo_birds/duobirdDefult.svg',
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 7),
                    Text(
                      'triolingo',
                      style: TextStyle(
                        fontFamily: 'Feather',
                        fontSize: 40,
                        color: Pallete.buttonMainColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 20),

                    WelcomeText(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
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
            SizedBox(
              width: double.infinity,
              child: OutlinedtypaButton(
                text: 'I ALREADY HAVE AN ACCOUNT',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SigninPage()),
                  );
                },
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
