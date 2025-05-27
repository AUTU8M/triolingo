import 'package:flutter/material.dart';
import 'package:triolingo/features/onboarding/view/pages/progressbar/progress_bar_8.dart';
import 'package:triolingo/features/onboarding/view/utils/progress_bar_7_list.dart';
import 'package:triolingo/features/onboarding/view/widgets/cloud_text_left.dart';
import 'package:triolingo/features/onboarding/view/widgets/duolingo_logo.dart';
import 'package:triolingo/features/onboarding/view/widgets/primary_button.dart';
import 'package:triolingo/features/onboarding/view/widgets/progress_list_tile.dart';
import 'package:triolingo/features/onboarding/view/widgets/progressbar_indicator.dart';

class ProgressBar7 extends StatefulWidget {
  const ProgressBar7({super.key});

  @override
  State<ProgressBar7> createState() => _ProgressBar2State();
}

class _ProgressBar2State extends State<ProgressBar7> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 31, 34, 1),
      appBar: ProgressbarIndicator(curretPage: 7),
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
                SizedBox(width: 5),
                ChatBubble(
                  padding: EdgeInsets.symmetric(
                    horizontal: 7.0,
                    vertical: 15.0,
                  ),
                  message: "What's your daily learning goal?",
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
                itemCount: seventhlistinfo.length,
                itemBuilder: (context, index) {
                  return ProgressListTile(
                    icon: seventhlistinfo[index]['icon'],
                    iconColor: seventhlistinfo[index]['iconColor'],
                    text: seventhlistinfo[index]['text'],
                    isSelected:
                        selectedOption == seventhlistinfo[index]['text'],
                    onTap: () {
                      setState(() {
                        selectedOption = seventhlistinfo[index]['text'];
                      });
                    },
                  );
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: PrimaryButton(
              text: 'CONTINUE',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressBar8()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
