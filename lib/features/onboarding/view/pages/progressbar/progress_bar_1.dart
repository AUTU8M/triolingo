import 'package:flutter/material.dart';
import 'package:triolingo/features/onboarding/view/pages/progressbar/progress_bar_2.dart';
import 'package:triolingo/features/onboarding/view/utils/language_data.dart';
import 'package:triolingo/features/onboarding/view/widgets/cloud_text_left.dart';
import 'package:triolingo/features/onboarding/view/widgets/duolingo_logo.dart';
import 'package:triolingo/features/onboarding/view/widgets/primary_button.dart';
import 'package:triolingo/features/onboarding/view/widgets/progressbar_indicator.dart';
import 'package:triolingo/features/onboarding/view/widgets/reusable_language_list.dart';

class ProgressBarOne extends StatefulWidget {
  const ProgressBarOne({super.key});

  @override
  State<ProgressBarOne> createState() => _ProgressBarOneState();
}

class _ProgressBarOneState extends State<ProgressBarOne> {
  String? selectedLanguage;

  void onLanguageSelected(String language) {
    setState(() {
      selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 31, 34, 1),
      appBar: ProgressbarIndicator(curretPage: 1),
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
                    selectedLanguage: selectedLanguage,
                    onLanguageSelected: onLanguageSelected,
                  ),
                  const SizedBox(height: 20),
                  ReusableLanguageList(
                    items: languageItemsEng,
                    listTitle: 'For English speakers',
                    itemBorderColor: const Color(0xFF30363D),
                    itemBorderWidth: 2,
                    selectedLanguage: selectedLanguage,
                    onLanguageSelected: onLanguageSelected,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 30.0,
                      bottom: 10.0,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 30),
            PrimaryButton(
              text: 'CONTINUE',
              onPressed: selectedLanguage == null
                  ? null
                  : () {
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
