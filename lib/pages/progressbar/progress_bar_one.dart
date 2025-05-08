import 'package:flutter/material.dart';
import 'package:triolingo/widgets/cloud_text_left.dart';
import 'package:triolingo/widgets/duolingo_logo.dart';

class ProgressBarOne extends StatelessWidget {
  const ProgressBarOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 31, 34, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  DuolingoLogo(
                    assetPath: 'assets/images/duo_birds/duobirdbg6.svg',
                  ),
                  SizedBox(width: 15),
                  ChatBubble(
                    message: 'What would you like to learn?',
                    borderWidth: 2,
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
