import 'package:flutter/material.dart';
import 'package:triolingo/features/onboarding/view/pages/progressbar/progress_bar_4.dart';
import 'package:triolingo/features/onboarding/view/utils/progress_bar_3_list.dart';
import 'package:triolingo/features/onboarding/view/widgets/cloud_text_left.dart';
import 'package:triolingo/features/onboarding/view/widgets/duolingo_logo.dart';
import 'package:triolingo/features/onboarding/view/widgets/primary_button.dart';
import 'package:triolingo/features/onboarding/view/widgets/progress_list_tile.dart';

class ProgressBar3 extends StatefulWidget {
  const ProgressBar3({super.key});

  @override
  State<ProgressBar3> createState() => _ProgressBar2State();
}

class _ProgressBar2State extends State<ProgressBar3> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 31, 34, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text('3'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                DuolingoLogo(
                  assetPath: 'assets/images/duo_birds/duobirdbg6.svg',
                  width: 100,
                  height: 130,
                ),
                SizedBox(width: 3),
                ChatBubble(
                  message: 'How much japanese do you\nDuolingo?',
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
                itemCount: secondlistinfo.length,
                itemBuilder: (context, index) {
                  return ProgressListTile(
                    icon: secondlistinfo[index]['icon'],
                    iconColor: secondlistinfo[index]['iconColor'],
                    text: secondlistinfo[index]['text'],
                    isSelected: selectedOption == secondlistinfo[index]['text'],
                    onTap: () {
                      setState(() {
                        selectedOption = secondlistinfo[index]['text'];
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
                  MaterialPageRoute(builder: (context) => ProgressBar4()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
