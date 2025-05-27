import 'package:flutter/material.dart';
import 'package:triolingo/features/onboarding/view/pages/progressbar/progress_bar_13.dart';
import 'package:triolingo/features/onboarding/view/utils/progress_bar_12_list.dart';
import 'package:triolingo/features/onboarding/view/widgets/cloud_text_left.dart';
import 'package:triolingo/features/onboarding/view/widgets/duolingo_logo.dart';
import 'package:triolingo/features/onboarding/view/widgets/primary_button.dart';
import 'package:triolingo/features/onboarding/view/widgets/progress_list_tile_second.dart';
import 'package:triolingo/features/onboarding/view/widgets/progressbar_indicator.dart';

class ProgressBar12 extends StatefulWidget {
  const ProgressBar12({super.key});

  @override
  State<ProgressBar12> createState() => _ProgressBar12State();
}

class _ProgressBar12State extends State<ProgressBar12> {
  @override
  Widget build(BuildContext context) {
    String? selectedOption;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 31, 34, 1),
      appBar: ProgressbarIndicator(curretPage: 12),
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
                  height: 100,
                ),
                SizedBox(width: 4),
                ChatBubble(
                  message: "Here's what you can achive in 3\nmonths!",
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
                itemCount: twelvethlistinfo.length,
                itemBuilder: (context, index) {
                  return ProgressListTileSecond(
                    icon: twelvethlistinfo[index]['icon'],
                    iconColor: twelvethlistinfo[index]['iconColor'],
                    text: twelvethlistinfo[index]['text'],
                    text1: twelvethlistinfo[index]['text1'],
                    isSelected:
                        selectedOption == twelvethlistinfo[index]['text'],
                    onTap: () {
                      setState(() {
                        selectedOption = twelvethlistinfo[index]['text'];
                      });
                    },
                  );
                },
              ),
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
                  MaterialPageRoute(builder: (context) => ProgressBar13()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
