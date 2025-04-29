import 'package:flutter/material.dart';
import 'package:triolingo/pages/progressbar/progress_bar_2.dart';
import 'package:triolingo/utils/flags.dart';
import 'package:triolingo/widgets/chat_header.dart';
import 'package:triolingo/widgets/language_tile.dart';
import 'package:triolingo/widgets/primary_button.dart';

class ProgressBarOne extends StatelessWidget {
  const ProgressBarOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 31, 34, 1), // Dark background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Chat header with Duo logo and text bubble
          const ChatHeader(message: 'What would you like to learn?'),

          // Main content in a scrollable area
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section title for Hindi speakers
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      top: 16,
                      bottom: 8,
                    ),
                    child: Text(
                      'For Hindi speakers',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Language list for Hindi speakers (not in an Expanded widget)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Disable scrolling for this list
                      itemCount: languageItems.length,
                      itemBuilder: (context, index) {
                        final item = languageItems[index];
                        return LanguageItemTile(item: item);
                      },
                    ),
                  ),

                  // Section title for English speakers
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      top: 16,
                      bottom: 8,
                    ),
                    child: Text(
                      'For English speakers',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Language list for English speakers (not in an Expanded widget)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Disable scrolling for this list
                      itemCount: languageItems.length,
                      itemBuilder: (context, index) {
                        final item = languageItems[index];
                        return LanguageItemTile(item: item);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Fixed continue button at bottom
          Padding(
            padding: const EdgeInsets.all(20),
            child: PrimaryButton(
              text: 'CONTINUE',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressBar2()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// The CountryFlag class remains unchanged
class CountryFlag extends StatelessWidget {
  final String countryCode;

  const CountryFlag({super.key, required this.countryCode});

  @override
  Widget build(BuildContext context) {
    // Return the flag based on country code
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      clipBehavior: Clip.antiAlias,
      child: _getFlagWidget(countryCode),
    );
  }

  Widget _getFlagWidget(String code) {
    // Map of country code to flag widgets
    Map<String, Widget> flags = {
      'US': _buildFlag(Colors.red, [], simpleColor: Colors.red),
      'ES': _buildFlag(Colors.red, [], simpleColor: Colors.red),
      'IT': _buildFlag(Colors.white, [
        Colors.green,
        Colors.white,
        Colors.red,
      ], isVertical: true),
      'JP': _buildFlag(Colors.white, [Colors.red]),
      'FR': _buildFlag(Colors.white, [
        Colors.blue,
        Colors.white,
        Colors.red,
      ], isVertical: true),
      'DE': _buildFlag(Colors.yellow, [
        Colors.black,
        Colors.red,
        Colors.yellow,
      ], isHorizontal: true),
      'IN': _buildFlag(Colors.white, [
        Colors.orange,
        Colors.white,
        Colors.green,
      ], isHorizontal: true),
    };

    return flags[code] ??
        Container(
          color: Colors.grey,
          child: Center(
            child: Text(
              code,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        );
  }

  // Simple helper to build flag-like widgets
  Widget _buildFlag(
    Color baseColor,
    List<Color> colors, {
    bool isVertical = false,
    bool isHorizontal = false,
    Color? simpleColor,
  }) {
    if (simpleColor != null) {
      // Simple colored rectangle for US and Spain flags
      return Container(color: simpleColor);
    }

    if (colors.length == 1) {
      // Special case for Japan
      return Container(
        color: baseColor,
        child: Center(
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(color: colors[0], shape: BoxShape.circle),
          ),
        ),
      );
    }

    if (isVertical) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            colors
                .map((color) => Expanded(child: Container(color: color)))
                .toList(),
      );
    } else if (isHorizontal) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            colors
                .map((color) => Expanded(child: Container(color: color)))
                .toList(),
      );
    } else {
      return Container(color: colors[0]);
    }
  }
}
