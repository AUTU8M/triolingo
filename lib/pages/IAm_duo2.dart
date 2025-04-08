import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triolingo/widgets/popup_text_message.dart';
import 'package:triolingo/widgets/primary_button.dart';

class IamDuo2 extends StatefulWidget {
  const IamDuo2({super.key});

  @override
  State<IamDuo2> createState() => _IamDuoState();
}

class _IamDuoState extends State<IamDuo2> {
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
                  child: PopupTextMessage(
                    message:
                        'Just 7 quick question before we start first lesson! ',
                  ),
                ),

                // Image (PNG or SVG)
                SvgPicture.asset(
                  'assets/images/duo_birds/duobird8.svg', // Replace with your own image path
                  width: 200,
                ),
              ],
            ),
          ),
          // Bottom spacer to push button to bottom
          const Expanded(flex: 1, child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: PrimaryButton(text: 'CONTINUE', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
