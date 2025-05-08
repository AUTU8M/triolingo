import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:triolingo/utils/language_item.dart'; // Assuming this is the correct path

// Reusable widget for displaying a list of languages/items
// CORRECTED: Removed Expanded and internal ListView.builder.
// This widget now just lays out its content and does NOT handle scrolling internally.
class ReusableLanguageList extends StatelessWidget {
  final List<LanguageItem> items;
  final String? listTitle;
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
    this.itemBackgroundColor = const Color.fromRGBO(19, 31, 34, 1),
    this.itemBorderColor = Colors.transparent, // No border by default
    this.itemBorderWidth = 1,
    this.itemBorderRadius = 14.0, // Rounded corners
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
    // REMOVED: Expanded widget is removed here.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // REMOVED: ListView.builder and its Expanded parent are removed.
      // We build the list items directly as children of this Column.
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
                color:
                    Colors
                        .white, // Changed title color to white for visibility on dark background
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        // Build the list items directly using map and spread into the Column's children
        ...items.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 7.0,
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
                        width: flagSize,
                        height: flagSize,
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
        }).toList(), // Convert the mapped iterable to a list of Widgets
      ],
    );
  }
}
