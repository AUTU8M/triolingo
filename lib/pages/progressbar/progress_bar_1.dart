import 'package:flutter/material.dart';
import 'package:triolingo/pages/progressbar/progress_bar_2.dart';
import 'package:triolingo/utils/language_data.dart';
import 'package:triolingo/widgets/cloud_text_left.dart';
import 'package:triolingo/widgets/duolingo_logo.dart';
import 'package:triolingo/widgets/primary_button.dart';
import 'package:triolingo/widgets/reusable_language_list.dart';

class ProgressBarOne extends StatelessWidget {
  const ProgressBarOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 31, 34, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text('1'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  DuolingoLogo(
                    assetPath: 'assets/images/duo_birds/duobirdbg6.svg',
                  ),
                  SizedBox(width: 15),
                  ChatBubble(
                    message: 'What would you like to learn?',
                    borderWidth: 2,
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                children: [
                  ReusableLanguageList(
                    items: languageItemsHindi,
                    listTitle: 'For Hindi speakers',
                    itemBorderColor: const Color(0xFF30363D),
                    itemBorderWidth: 2,
                  ),
                  // Added spacing between the two lists
                  const SizedBox(height: 20),
                  ReusableLanguageList(
                    items:
                        languageItemsEng, // Use the list from language_data.dart
                    listTitle: 'For English speakers',
                    itemBorderColor: const Color(0xFF30363D),
                    itemBorderWidth: 2,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 30.0,
                      bottom: 10.0,
                    ), // Adjusted bottom padding
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
            PrimaryButton(
              text: 'CONTINUE',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressBar2()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
