import 'package:flutter/material.dart';
import 'package:triolingo/features/onboarding/view/pages/progressbar/progress_bar_7.dart';
import 'package:triolingo/features/onboarding/view/widgets/cloud_text_left.dart';
import 'package:triolingo/features/onboarding/view/widgets/duolingo_logo.dart';
import 'package:triolingo/features/onboarding/view/widgets/primary_button.dart';

class ProgressBar6 extends StatelessWidget {
  const ProgressBar6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 31, 34, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text('6 '),
      ),
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
                SizedBox(width: 5),
                ChatBubble(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.0,
                    vertical: 15.0,
                  ),
                  message: "Let's set up a learning routine!",
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
                  MaterialPageRoute(builder: (context) => ProgressBar7()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
