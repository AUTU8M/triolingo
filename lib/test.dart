// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:triolingo/utils/language_item.dart';

class ReusableLanguageList extends StatelessWidget {
  // This now refers to the LanguageItem class imported above
  final List<LanguageItem> items;
  final String? listTitle; // Optional title for the list
  final Color itemBackgroundColor;
  final Color itemBorderColor;
  final double itemBorderWidth;
  final double itemBorderRadius;
  final EdgeInsets itemPadding;
  final TextStyle itemTextStyle;
  final double iconSize;
  final double flagSize;

  const ReusableLanguageList({
    super.key,
    required this.items,
    this.listTitle,
    this.itemBackgroundColor = const Color.fromRGBO(
      19,
      31,
      34,
      1,
    ), // Dark background like Duolingo
    this.itemBorderColor = Colors.transparent, // No border by default
    this.itemBorderWidth = 0,
    this.itemBorderRadius = 8.0, // Rounded corners
    this.itemPadding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12.0,
    ),
    this.itemTextStyle = const TextStyle(
      color: Colors.white, // White text color
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
    ),
    this.iconSize = 28.0,
    this.flagSize = 28.0,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Use Expanded to allow the list to take available space
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Optional list title
          if (listTitle != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 8.0,
              ),
              child: Text(
                listTitle!,
                style: const TextStyle(
                  color: Colors.grey, // Grey color for the title
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          // The scrollable list
          Expanded(
            // Expanded is needed here too for ListView inside Column
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ), // Add vertical spacing between items
                  child: InkWell(
                    // Use InkWell for tap effect
                    onTap: () {
                      print('Tapped on ${item.name}');
                    },
                    borderRadius: BorderRadius.circular(itemBorderRadius),
                    child: Container(
                      padding: itemPadding,
                      decoration: BoxDecoration(
                        color: itemBackgroundColor,
                        borderRadius: BorderRadius.circular(itemBorderRadius),
                        border: Border.all(
                          color: itemBorderColor,
                          width: itemBorderWidth,
                        ),
                      ),
                      child: Row(
                        children: [
                          // Display flag or icon
                          if (item.countryCode != null)
                            CountryFlag.fromCountryCode(
                              item.countryCode!,
                              width: flagSize, // Corrected parameter name
                              height: flagSize, // Corrected parameter name
                            )
                          else if (item.icon != null)
                            Icon(
                              item.icon,
                              color: Colors.white, // Icon color
                              size: iconSize,
                            ),
                          const SizedBox(
                            width: 16.0,
                          ), // Spacing between icon/flag and text
                          // Display language name
                          Text(item.name, style: itemTextStyle),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
