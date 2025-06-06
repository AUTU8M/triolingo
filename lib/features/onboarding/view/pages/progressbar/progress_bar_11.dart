import 'package:flutter/material.dart';
import 'package:triolingo/features/onboarding/view/pages/progressbar/progress_bar_12.dart';
import 'package:triolingo/features/onboarding/view/widgets/cloud_text_left.dart';
import 'package:triolingo/features/onboarding/view/widgets/duolingo_logo.dart';
import 'package:triolingo/features/onboarding/view/widgets/primary_button.dart';
import 'package:triolingo/features/onboarding/view/widgets/progressbar_indicator.dart';

class ProgressBar11 extends StatelessWidget {
  const ProgressBar11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 31, 34, 1),
      appBar: ProgressbarIndicator(curretPage: 11),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                DuolingoLogo(
                  assetPath: 'assets/images/duo_birds/duobirdDefult.svg',
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 14),
                ChatBubble(
                  message:
                      "Press and hold on your home\nscreen and add our widget.",
                  borderWidth: 2,
                ),
              ],
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),
          const SizedBox(height: 30),
          PrimaryButton(
            text: 'CONTINUE',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProgressBar12()),
              );
            },
            bottomPadding: 24, // Add bottom padding for spacing from screen edge
          ),
        ],
      ),
    );
  }
}
