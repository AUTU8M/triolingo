import 'package:flutter/material.dart';
import 'package:triolingo/pages/progressbar/progress_bar_3.dart';
import 'package:triolingo/utils/progress_bar_2_list.dart';
import 'package:triolingo/widgets/cloud_text_left.dart';
import 'package:triolingo/widgets/duolingo_logo.dart';
import 'package:triolingo/widgets/primary_button.dart';
import 'package:triolingo/widgets/progress_list_tile.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text('2'),
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

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: PrimaryButton(
              text: 'CONTINUE',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressBar3()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
