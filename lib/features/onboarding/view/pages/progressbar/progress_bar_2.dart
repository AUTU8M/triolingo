import 'package:flutter/material.dart';
import 'package:triolingo/features/onboarding/view/pages/progressbar/progress_bar_3.dart';
import 'package:triolingo/features/onboarding/view/utils/progress_bar_2_list.dart';
import 'package:triolingo/features/onboarding/view/widgets/cloud_text_left.dart';
import 'package:triolingo/features/onboarding/view/widgets/duolingo_logo.dart';
import 'package:triolingo/features/onboarding/view/widgets/primary_button.dart';
import 'package:triolingo/features/onboarding/view/widgets/progress_list_tile.dart';
import 'package:triolingo/features/onboarding/view/widgets/progressbar_indicator.dart';

class ProgressBar2 extends StatefulWidget {
  const ProgressBar2({super.key});

  @override
  State<ProgressBar2> createState() => _ProgressBar2State();
}

class _ProgressBar2State extends State<ProgressBar2> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 31, 34, 1),
      appBar: ProgressbarIndicator(curretPage: 2),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                DuolingoLogo(
                  assetPath: 'assets/images/duo_birds/duobird3.svg',
                  width: 100,
                  height: 130,
                ),
                SizedBox(width: 14),
                ChatBubble(
                  message: 'How did you hear about \nDuolingo?',
                  borderWidth: 2,
                ),
              ],
            ),
          ),

          // Options list
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                itemCount: firstlistinfo.length,
                itemBuilder: (context, index) {
                  return ProgressListTile(
                    icon: firstlistinfo[index]['icon'],
                    iconColor: firstlistinfo[index]['iconColor'],
                    text: firstlistinfo[index]['text'],
                    isSelected: selectedOption == firstlistinfo[index]['text'],
                    onTap: () {
                      setState(() {
                        selectedOption = firstlistinfo[index]['text'];
                      });
                    },
                  );
                },
              ),
            ),
          ),

          // Remove extra Padding around PrimaryButton
          const SizedBox(height: 30),
          PrimaryButton(
            text: 'CONTINUE',
            onPressed: selectedOption == null
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProgressBar3()),
                    );
                  },
            bottomPadding: 24, // Add bottom padding for spacing from screen edge
          ),
        ],
      ),
    );
  }
}
