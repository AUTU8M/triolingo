import 'package:flutter/material.dart';

import 'package:triolingo/pages/I_am_duo2.dart';
import 'package:triolingo/widgets/duolingo_logo.dart';
import 'package:triolingo/widgets/popup_text_message.dart';
import 'package:triolingo/widgets/primary_button.dart';

class IamDuo extends StatefulWidget {
  const IamDuo({super.key});

  @override
  State<IamDuo> createState() => _IamDuoState();
}

class _IamDuoState extends State<IamDuo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
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
                  top: -40,
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: PrimaryButton(
              text: 'CONTINUE',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IamDuo2()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
