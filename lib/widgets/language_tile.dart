import 'package:flutter/material.dart';
import 'package:triolingo/pages/progressbar/progress_bar_1.dart';
import 'package:triolingo/utils/flags.dart';

class LanguageItemTile extends StatelessWidget {
  final LanguageItem item;
  final VoidCallback? onTap;

  const LanguageItemTile({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.transparent, // Transparent background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ), // White outline
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap:
              onTap ??
              () {
                // Default navigation behavior if no custom onTap is provided
              },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                // Country flag or icon
                buildLeadingWidget(),
                const SizedBox(width: 16),
                // Language name
                Expanded(
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLeadingWidget() {
    if (item.countryCode != null) {
      return CountryFlag(countryCode: item.countryCode!);
    } else if (item.icon != null) {
      // Special icon for items like music and mathematics
      Color iconColor;
      Color bgColor;

      if (item.name == 'संगीत') {
        iconColor = Colors.purple;
        bgColor = Colors.transparent; // Transparent background
      } else if (item.name == 'गणित') {
        iconColor = Colors.blue;
        bgColor = Colors.transparent; // Transparent background
      } else {
        iconColor = Colors.blue;
        bgColor = Colors.transparent; // Transparent background
      }

      return Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.white, width: 1.5), // White outline
        ),
        child: Icon(item.icon, color: iconColor, size: 22),
      );
    } else {
      return const SizedBox(width: 36, height: 36);
    }
  }
}
