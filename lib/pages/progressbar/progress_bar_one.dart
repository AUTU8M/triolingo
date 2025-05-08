import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
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

            ReusableLanguageList(
              items: languageItemsHindi,
              listTitle: 'For Hindi speakers',
              itemBorderColor: const Color(0xFF30363D),
              itemBorderWidth: 2,
            ),
            ReusableLanguageList(
              items: languageItemsEng,
              listTitle: 'For English speakers',
              itemBorderColor: const Color(0xFF30363D),
              itemBorderWidth: 2,
            ),

            PrimaryButton(text: 'CONTINUE', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
