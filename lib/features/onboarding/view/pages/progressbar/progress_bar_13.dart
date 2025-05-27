import 'package:flutter/material.dart';
import 'package:triolingo/features/onboarding/view/pages/landing/last_page_progress.dart';
import 'package:triolingo/features/onboarding/view/widgets/cloud_text_left.dart';
import 'package:triolingo/features/onboarding/view/widgets/duolingo_logo.dart';
import 'package:triolingo/features/onboarding/view/widgets/primary_button.dart';
import 'package:triolingo/features/onboarding/view/widgets/progressbar_indicator.dart';

class ProgressBar13 extends StatelessWidget {
  const ProgressBar13({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 31, 34, 1),
      appBar: ProgressbarIndicator(curretPage: 13),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.0,
                    vertical: 15.0,
                  ),
                  message: "Now let's find the best place to\nstart!",
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
                  MaterialPageRoute(builder: (context) => LastPageProgress()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
