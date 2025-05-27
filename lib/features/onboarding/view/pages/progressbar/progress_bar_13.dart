import 'package:flutter/material.dart';
import 'package:triolingo/features/onboarding/view/pages/landing/last_page_progress.dart';
import 'package:triolingo/features/onboarding/view/utils/progress_bar_13_list.dart';
import 'package:triolingo/features/onboarding/view/widgets/cloud_text_left.dart';
import 'package:triolingo/features/onboarding/view/widgets/duolingo_logo.dart';
import 'package:triolingo/features/onboarding/view/widgets/primary_button.dart';
import 'package:triolingo/features/onboarding/view/widgets/progress_list_tile_second.dart';
import 'package:triolingo/features/onboarding/view/widgets/progressbar_indicator.dart';

class ProgressBar13 extends StatefulWidget {
  const ProgressBar13({super.key});

  @override
  State<ProgressBar13> createState() => _ProgressBar13State();
}

class _ProgressBar13State extends State<ProgressBar13> {
  @override
  Widget build(BuildContext context) {
    String? selectedOption;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 31, 34, 1),
      appBar: ProgressbarIndicator(curretPage: 13),
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
                SizedBox(width: 14),
                ChatBubble(
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.0,
                    vertical: 15.0,
                  ),
                  message: "Now let's find the best place to\nstart!",
                  borderWidth: 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                itemCount: thirteenthlistinfo.length,
                itemBuilder: (context, index) {
                  return ProgressListTileSecond(
                    width: 37,
                    height: 55,
                    iconsize: 50,
                    sizeboxheight: 6,
                    bordeRadiousWidth: 1.7,
                    borderColor: Color.fromARGB(204, 102, 100, 100),
                    icon: thirteenthlistinfo[index]['icon'],
                    text: thirteenthlistinfo[index]['text'],
                    text1: thirteenthlistinfo[index]['text1'],
                    isSelected:
                        selectedOption == thirteenthlistinfo[index]['text'],
                    onTap: () {
                      setState(() {
                        selectedOption = thirteenthlistinfo[index]['text'];
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
                  MaterialPageRoute(builder: (context) => LastPageProgress()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
