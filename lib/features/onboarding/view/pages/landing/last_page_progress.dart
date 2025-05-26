import 'package:flutter/material.dart';
import 'package:triolingo/features/onboarding/view/pages/progressbar/progress_bar_1.dart';
import 'package:triolingo/features/onboarding/view/widgets/duolingo_logo.dart';
import 'package:triolingo/features/onboarding/view/widgets/popup_text_message.dart';
import 'package:triolingo/features/onboarding/view/widgets/primary_button.dart';

class LastPageProgress extends StatefulWidget {
  const LastPageProgress({super.key});

  @override
  State<LastPageProgress> createState() => _IAmDuo2State();
}

class _IAmDuo2State extends State<LastPageProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 31, 34, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(19, 31, 34, 1),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Expanded(flex: 1, child: SizedBox()),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                // Speech Bubble using the reusable widget
                const Positioned(
                  top: -50,
                  child: PopupTextMessage(
                    maxWidth: 290,
                    message: "Okay! here's your first 2 minute \n lesson.",
                  ),
                ),

                // Image (PNG or SVG)
                DuolingoLogo(
                  assetPath: 'assets/images/duo_birds/duobirdbg1.svg',
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ),
          // Bottom spacer to push button to bottom
          const Expanded(flex: 1, child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: PrimaryButton(
              text: 'CONTINUE',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressBarOne()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
