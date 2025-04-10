class LanguageSelectionScreen extends StatelessWidget {
  final bool isHindiSpeaker; // Toggle between two screens

  const LanguageSelectionScreen({Key? key, required this.isHindiSpeaker})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Select the appropriate list based on speaker type
    final items = isHindiSpeaker ? languageItems : languageItemsEng;
    final headerText =
        isHindiSpeaker ? 'For Hindi speakers' : 'For English speakers';

    return Scaffold(
      backgroundColor: const Color(0xFF1A1E22),
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
          // Mascot and prompt
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/mascot.png', // Add your mascot image
                  height: 80,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF2A2E32),
                    ),
                    child: const Text(
                      'What would you like to learn?',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // "For Hindi/English speakers" header
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                top: 16.0,
                bottom: 8.0,
              ),
              child: Text(
                headerText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Scrollable list of language options
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
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
                                borderRadius: 4,
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

          // Continue button
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle continue action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade600,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'CONTINUE',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
