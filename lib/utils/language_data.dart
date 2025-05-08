import 'package:flutter/material.dart';
import 'package:triolingo/utils/language_item.dart'; // Needed for Icons like music_note, calculate
// <-- Import the LanguageItem class from its new location

final List<LanguageItem> languageItemsHindi = [
  LanguageItem(name: 'इंग्लिश', countryCode: 'US'),
  LanguageItem(name: 'स्पैनिश', countryCode: 'ES'),
  LanguageItem(name: 'इतालवी', countryCode: 'IT'),
  LanguageItem(name: 'जापानी', countryCode: 'JP'),
  LanguageItem(name: 'फ़्रेंच', countryCode: 'FR'),
  LanguageItem(name: 'जर्मन', countryCode: 'DE'),
  LanguageItem(name: 'संगीत', icon: Icons.music_note),
  LanguageItem(name: 'गणित', icon: Icons.calculate),
];

final List<LanguageItem> languageItemsEng = [
  LanguageItem(name: 'English', countryCode: 'US'),
  LanguageItem(name: 'Spanish', countryCode: 'ES'),
  LanguageItem(name: 'Italian', countryCode: 'IT'),
  LanguageItem(name: 'Japanese', countryCode: 'JP'),
  LanguageItem(name: 'French', countryCode: 'FR'),
  LanguageItem(name: 'German', countryCode: 'DE'),
  LanguageItem(name: 'Music', icon: Icons.music_note),
  LanguageItem(name: 'Mathematics', icon: Icons.calculate),
  LanguageItem(name: 'Tamil', countryCode: 'IN'),
  LanguageItem(name: 'Bangla', countryCode: 'IN'),
];
