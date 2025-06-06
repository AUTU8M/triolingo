import 'package:flutter/material.dart';
import 'package:triolingo/features/onboarding/view/pages/landing/I_am_duo2.dart';

import 'package:triolingo/features/onboarding/view/widgets/duolingo_logo.dart';
import 'package:triolingo/features/onboarding/view/widgets/popup_text_message.dart';
import 'package:triolingo/features/onboarding/view/widgets/primary_button.dart';

class IamDuo extends StatefulWidget {
  const IamDuo({super.key});

  @override
  State<IamDuo> createState() => _IamDuoState();
}

class _IamDuoState extends State<IamDuo> {
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
                  top: -30,
                  child: PopupTextMessage(message: 'Hi there, im duo, '),
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
          const SizedBox(height: 30),
          PrimaryButton(
            text: 'CONTINUE',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IAmDuo2()),
              );
            },
            bottomPadding: 24, // Add bottom padding for spacing from screen edge
          ),
        ],
      ),
    );
  }
}
