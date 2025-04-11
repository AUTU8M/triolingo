import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:triolingo/utils/flags.dart';
import 'package:triolingo/widgets/cloud_thinking_text.dart';

import 'package:triolingo/widgets/duolingo_logo.dart';
import 'package:triolingo/widgets/listview_intro.dart';

class ProgressBarOne extends StatelessWidget {
  const ProgressBarOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                DuolingoLogo(assetPath: 'assets/images/duo_birds/duobird6.svg'),
                const SizedBox(width: 16),
                ChatBubble(
                  message: 'What would you like to learn?',
                  borderColor: const Color.fromARGB(255, 145, 141, 141),
                ),
              ],
            ),
          ),
          ListviewIntro(text: 'For Hindi speakers'),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: languageItems.length,
              itemBuilder: (context,index){
                final item =languageItems[index];

            })
          )
        ],
      ),
    );
  }
}
   Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: languageItems.length,
              itemBuilder: (context, index) {
                final item = languageItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 6.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2E32),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading:
                          item.countryCode != null
                              ? CountryFlag.fromCountryCode(
                                item.countryCode!,
                                height: 30,
                                width: 30,
                              )
                              : Icon(item.icon, color: Colors.white, size: 30),
                      title: Text(
                        item.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        // Handle language selection
                        print('Selected: ${item.name}');
                      },
                    ),
                  ),
                );
              },
            ),
          ),