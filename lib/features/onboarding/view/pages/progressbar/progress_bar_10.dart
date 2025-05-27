import 'package:flutter/material.dart';
import 'package:triolingo/features/onboarding/view/pages/progressbar/progress_bar_11.dart';
import 'package:triolingo/features/onboarding/view/widgets/cloud_text_left.dart';
import 'package:triolingo/features/onboarding/view/widgets/duolingo_logo.dart';
import 'package:triolingo/features/onboarding/view/widgets/primary_button.dart';
import 'package:triolingo/features/onboarding/view/widgets/progressbar_indicator.dart';

class ProgressBar10 extends StatelessWidget {
  const ProgressBar10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 31, 34, 1),
      appBar: ProgressbarIndicator(curretPage: 10),
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
                  message: "and i'll cheer you on from your\nhome screen!",
                  borderWidth: 2,
                ),
              ],
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: PrimaryButton(
              text: 'CONTINUE',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressBar11()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
