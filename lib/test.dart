import 'package:flutter/material.dart';

// --- Reusable Logo Widget ---
// You can replace this with your actual mascot widget
class DuolingoMascot extends StatelessWidget {
  final double size;

  const DuolingoMascot({super.key, this.size = 100.0});

  @override
  Widget build(BuildContext context) {
    // Placeholder for your Duolingo mascot image
    // Replace this with your actual Image.asset or SvgPicture.asset
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.green[400], // Placeholder color
        shape: BoxShape.circle,
        border: Border.all(color: Colors.green[700]!, width: 5),
      ),
      child: Center(
        child: Icon(
          Icons.face_retouching_natural, // Placeholder icon
          size: size * 0.6,
          color: Colors.white,
        ),
      ),
    );
  }
}

// --- Reusable Selectable List Item ---
class SelectableListItem extends StatelessWidget {
  final String text;
  final IconData? icon; // Optional icon
  final bool isSelected;
  final VoidCallback onTap;
  final bool showCheckbox; // To show checkbox on the right for multi-select

  const SelectableListItem({
    super.key,
    required this.text,
    this.icon,
    required this.isSelected,
    required this.onTap,
    this.showCheckbox = false, // Default to false (single select behavior)
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.lightBlue[100] : Colors.grey[800],
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected ? Colors.blue[700]! : Colors.grey[700]!,
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            // Optional Icon on the left
            if (icon != null) ...[
              Icon(
                icon,
                color: isSelected ? Colors.blue[700] : Colors.white70,
                size: 24.0,
              ),
              const SizedBox(width: 16.0),
            ],
            // Text in the middle
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.blue[900] : Colors.white,
                  fontSize: 16.0,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            // Optional Checkbox on the right
            if (showCheckbox)
              Theme(
                data: ThemeData(
                  unselectedWidgetColor:
                      Colors.white54, // Color for unchecked checkbox
                ),
                child: Checkbox(
                  value: isSelected,
                  onChanged: (bool? value) {
                    onTap(); // Trigger the onTap callback
                  },
                  activeColor: Colors.blue[700],
                  checkColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: BorderSide(
                    color: isSelected ? Colors.blue[700]! : Colors.white54,
                    width: 2,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// --- Example Screen Using the Reusable Components ---
// This screen demonstrates a single-select list
class SingleSelectSurveyPage extends StatefulWidget {
  final String question;
  final List<String> options;
  final List<IconData?>? icons; // Optional icons for each option

  const SingleSelectSurveyPage({
    super.key,
    required this.question,
    required this.options,
    this.icons,
  }) : assert(
         icons == null || icons.length == options.length,
         "If icons are provided, their count must match options count",
       );

  @override
  State<SingleSelectSurveyPage> createState() => _SingleSelectSurveyPageState();
}

class _SingleSelectSurveyPageState extends State<SingleSelectSurveyPage> {
  String? _selectedOption; // For single selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Dark background similar to Duolingo
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // You can add a progress bar here if needed
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Mascot and Question Bubble (You mentioned you have this covered)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DuolingoMascot(size: 80),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      widget.question,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),

            // Reusable List View
            Expanded(
              child: ListView.builder(
                itemCount: widget.options.length,
                itemBuilder: (context, index) {
                  final option = widget.options[index];
                  final icon =
                      (widget.icons != null && widget.icons!.length > index)
                          ? widget.icons![index]
                          : null;
                  return SelectableListItem(
                    text: option,
                    icon: icon,
                    isSelected: _selectedOption == option,
                    onTap: () {
                      setState(() {
                        _selectedOption = option;
                      });
                      // You might want to add a delay or check if an option is selected
                      // before enabling the continue button or auto-navigating.
                    },
                  );
                },
              ),
            ),

            // Continue Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _selectedOption != null
                        ? Colors.greenAccent[700]
                        : Colors.grey[700],
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                textStyle: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed:
                  _selectedOption != null
                      ? () {
                        // Handle continue action
                        print('Selected: $_selectedOption');
                        // Navigate to the next page or perform an action
                      }
                      : null, // Button is disabled if no option is selected
              child: const Text(
                'CONTINUE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// This screen demonstrates a multi-select list
class MultiSelectSurveyPage extends StatefulWidget {
  final String question;
  final List<String> options;
  final List<IconData?>? icons; // Optional icons for each option

  const MultiSelectSurveyPage({
    super.key,
    required this.question,
    required this.options,
    this.icons,
  }) : assert(
         icons == null || icons.length == options.length,
         "If icons are provided, their count must match options count",
       );
  @override
  State<MultiSelectSurveyPage> createState() => _MultiSelectSurveyPageState();
}

class _MultiSelectSurveyPageState extends State<MultiSelectSurveyPage> {
  final Set<String> _selectedOptions = {}; // For multiple selections

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DuolingoMascot(size: 80),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      widget.question,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Expanded(
              child: ListView.builder(
                itemCount: widget.options.length,
                itemBuilder: (context, index) {
                  final option = widget.options[index];
                  final icon =
                      (widget.icons != null && widget.icons!.length > index)
                          ? widget.icons![index]
                          : null;
                  return SelectableListItem(
                    text: option,
                    icon: icon,
                    isSelected: _selectedOptions.contains(option),
                    showCheckbox: true, // Enable checkbox for multi-select
                    onTap: () {
                      setState(() {
                        if (_selectedOptions.contains(option)) {
                          _selectedOptions.remove(option);
                        } else {
                          _selectedOptions.add(option);
                        }
                      });
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _selectedOptions.isNotEmpty
                        ? Colors.greenAccent[700]
                        : Colors.grey[700],
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                textStyle: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed:
                  _selectedOptions.isNotEmpty
                      ? () {
                        print('Selected: $_selectedOptions');
                      }
                      : null,
              child: const Text(
                'CONTINUE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Main Application (for demonstration) ---
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Duolingo Clone Components',
      theme: ThemeData(
        brightness: Brightness.dark, // Overall dark theme
        primarySwatch: Colors.green,
        fontFamily:
            'Nunito', // A font similar to Duolingo's (add to pubspec.yaml)
      ),
      home: const HomeScreen(), // Start with a home screen to navigate
    );
  }
}

// --- Home Screen to Navigate to Examples ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for the first type of screen (single select)
    final List<String> howDidYouHearOptions = [
      "YouTube",
      "Google Search",
      "Facebook/Instagram",
      "App store",
      "TikTok",
      "News/article/blog",
      "Friends/family",
      "TV",
      "Other",
    ];

    final List<IconData?> howDidYouHearIcons = [
      Icons.play_circle_fill,
      Icons.search,
      Icons.facebook,
      Icons.store,
      Icons.music_note, // Placeholder for TikTok
      Icons.article,
      Icons.people,
      Icons.tv,
      Icons.more_horiz,
    ];

    // Example data for the second type of screen (multi-select)
    final List<String> reasonsToLearnOptions = [
      "Support my education",
      "Connect with people",
      "Just for fun",
      "Boost my career",
      "Prepare for travel",
      "Spend time productively",
      "Other",
    ];

    final List<IconData?> reasonsToLearnIcons = [
      Icons.school,
      Icons.group_add,
      Icons.sentiment_satisfied_alt,
      Icons.work,
      Icons.flight_takeoff,
      Icons.hourglass_bottom,
      Icons.more_horiz,
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Duolingo Clone Examples')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => SingleSelectSurveyPage(
                            question: "How did you hear about Duolingo?",
                            options: howDidYouHearOptions,
                            icons: howDidYouHearIcons,
                          ),
                    ),
                  );
                },
                child: const Text("Single-Select Example"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => MultiSelectSurveyPage(
                            question: "Those are all great reasons to learn!",
                            options: reasonsToLearnOptions,
                            icons: reasonsToLearnIcons,
                          ),
                    ),
                  );
                },
                child: const Text("Multi-Select Example"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
