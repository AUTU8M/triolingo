import 'package:flutter/material.dart';
import 'package:triolingo/pages/progressbar/progress_bar_1.dart';
import 'package:triolingo/widgets/duolingo_logo.dart';
import 'package:triolingo/widgets/popup_text_message.dart';
import 'package:triolingo/widgets/primary_button.dart';

class IAmDuo2 extends StatefulWidget {
  const IAmDuo2({super.key});

  @override
  State<IAmDuo2> createState() => _IAmDuo2State();
}

class _IAmDuo2State extends State<IAmDuo2> {
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
                    message:
                        'just  7 quick questions before we \nstart your first lesson!',
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
