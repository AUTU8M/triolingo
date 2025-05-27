import 'package:flutter/material.dart';
import 'package:triolingo/features/onboarding/view/pages/progressbar/progress_bar_6.dart';
import 'package:triolingo/features/onboarding/view/utils/progress_bar_5_list.dart';
import 'package:triolingo/features/onboarding/view/widgets/cloud_text_left.dart';
import 'package:triolingo/features/onboarding/view/widgets/duolingo_logo.dart';
import 'package:triolingo/features/onboarding/view/widgets/primary_button.dart';
import 'package:triolingo/features/onboarding/view/widgets/progress_list_tile.dart';
import 'package:triolingo/features/onboarding/view/widgets/progressbar_indicator.dart';

class ProgressBar5 extends StatefulWidget {
  const ProgressBar5({super.key});

  @override
  State<ProgressBar5> createState() => _ProgressBar2State();
}

class _ProgressBar2State extends State<ProgressBar5> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 31, 34, 1),
      appBar: ProgressbarIndicator(curretPage: 5),
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
                    horizontal: 12.0,
                    vertical: 15.0,
                  ),
                  message: 'Those are all great reasons to\nlearn!',
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
                itemCount: fifthlistinfo.length,
                itemBuilder: (context, index) {
                  return ProgressListTile(
                    icon: fifthlistinfo[index]['icon'],
                    iconColor: fifthlistinfo[index]['iconColor'],
                    text: fifthlistinfo[index]['text'],
                    isSelected: selectedOption == fifthlistinfo[index]['text'],
                    onTap: () {
                      setState(() {
                        selectedOption = fifthlistinfo[index]['text'];
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
                  MaterialPageRoute(builder: (context) => ProgressBar6()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
