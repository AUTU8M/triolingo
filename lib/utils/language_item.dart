import 'package:flutter/material.dart'; // Needed for IconData

class LanguageItem {
  final String name;
  final String? countryCode;
  final IconData? icon;

  LanguageItem({required this.name, this.countryCode, this.icon});
}
