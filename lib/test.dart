import 'package:flutter/material.dart';

// Data model for a language
class Language {
  final String
  flagEmoji; // Using emoji for simplicity, can be replaced with image asset
  final String name;
  final String nameLocal; // e.g., "इंग्लिश"

  Language({
    required this.flagEmoji,
    required this.name,
    required this.nameLocal,
  });

  // Added equality check for selection logic
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Language &&
          runtimeType == other.runtimeType &&
          flagEmoji == other.flagEmoji &&
          name == other.name &&
          nameLocal == other.nameLocal;

  @override
  int get hashCode => flagEmoji.hashCode ^ name.hashCode ^ nameLocal.hashCode;
}

// Reusable widget for each language item in the list
class LanguageListItem extends StatelessWidget {
  final Language language;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageListItem({
    super.key,
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, // No shadow, flat design
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      color:
          isSelected
              ? const Color(0xFF58CC02).withOpacity(
                0.2,
              ) // Green background for selected
              : const Color(0xFF2A333A), // Dark background for not selected
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color:
              isSelected
                  ? const Color(0xFF58CC02) // Green border for selected
                  : const Color(0xFF4A5560), // Grey border for not selected
          width: 2.0,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            children: [
              Text(
                language.flagEmoji,
                style: const TextStyle(fontSize: 28.0), // Adjust size as needed
              ),
              const SizedBox(width: 16.0),
              Expanded(
                // Use Expanded to prevent overflow for long names
                child: Text(
                  language
                      .nameLocal, // Displaying the localized name as in the screenshot
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color:
                        isSelected
                            ? const Color(0xFF58CC02) // Green text for selected
                            : Colors.white.withOpacity(
                              0.9,
                            ), // White text for not selected
                  ),
                  overflow: TextOverflow.ellipsis, // Handle long text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// The main page widget for language selection
class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  // Sample list of languages - replace with your actual data
  final List<Language> languages = [
    Language(flagEmoji: '🇺🇸', name: 'English', nameLocal: 'इंग्लिश'),
    Language(flagEmoji: '🇪🇸', name: 'Spanish', nameLocal: 'स्पैनिश'),
    Language(flagEmoji: '🇮🇹', name: 'Italian', nameLocal: 'इटेलियन'),
    Language(flagEmoji: '🇯🇵', name: 'Japanese', nameLocal: 'जापानी'),
    Language(flagEmoji: '🇫🇷', name: 'French', nameLocal: 'फ्रेंच'),
    Language(flagEmoji: '🇩🇪', name: 'German', nameLocal: 'जर्मन'),
    Language(
      flagEmoji: '🎶',
      name: 'Music',
      nameLocal: 'संगीत',
    ), // Using music note for "Music"
    Language(
      flagEmoji: '➕',
      name: 'Math',
      nameLocal: 'गणित',
    ), // Using plus for "Math"
  ];

  Language? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using a dark background color similar to the screenshot
      backgroundColor: const Color(0xFF1A2025),
      body: SafeArea(
        child: Column(
          children: [
            // --- Placeholder for Top Section (Logo and "What would you like to learn?") ---
            // Based on the screenshot and your previous code, this top section
            // with the Duolingo logo and question text seems to be present.
            // You would typically add widgets here for that content.
            // For example:
            /*
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Column(
                children: [
                   Image.asset('assets/duo_logo.png', height: 80), // Replace with your logo asset
                   const SizedBox(height: 10),
                   Text(
                     'What would you like to learn?',
                     style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                       color: Colors.white.withOpacity(0.8),
                     ),
                     textAlign: TextAlign.center,
                   ),
                   const SizedBox(height: 20),
                ],
              ),
            ),
            */
            // --- End of Top Section Placeholder ---

            // Section Header "For Hindi speakers" (or similar)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'For Hindi speakers', // Or dynamically change based on user language
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Scrollable list of languages using the reusable LanguageListItem
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final language = languages[index];
                  return LanguageListItem(
                    language: language,
                    isSelected: _selectedLanguage == language,
                    onTap: () {
                      setState(() {
                        _selectedLanguage = language;
                      });
                    },
                  );
                },
              ),
            ),

            // Fixed "CONTINUE" button at the bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _selectedLanguage != null
                          ? const Color(
                            0xFF58CC02,
                          ) // Duolingo green when enabled
                          : const Color(
                            0xFF58CC02,
                          ).withOpacity(0.5), // Greyed out when disabled
                  minimumSize: const Size(double.infinity, 50), // Full width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed:
                    _selectedLanguage != null
                        ? () {
                          // Handle navigation or action with the selected language
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Selected: ${_selectedLanguage!.name}',
                              ),
                              backgroundColor: const Color(0xFF58CC02),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          // TODO: Navigate to the next screen with _selectedLanguage
                        }
                        : null, // Disable button if no language is selected
                child: Text(
                  'CONTINUE',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:
                        _selectedLanguage != null
                            ? const Color(0xFF1A2025) // Dark text when enabled
                            : Colors.white.withOpacity(
                              0.8,
                            ), // White text when disabled
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
