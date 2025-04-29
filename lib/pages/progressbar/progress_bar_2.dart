import 'package:flutter/material.dart';

import 'package:triolingo/widgets/primary_button.dart';

class ProgressBar2 extends StatefulWidget {
  const ProgressBar2({Key? key}) : super(key: key);

  @override
  _HowDidYouHearPageState createState() => _HowDidYouHearPageState();
}

class _HowDidYouHearPageState extends State<ProgressBar2> {
  int? _selectedOption;

  final List<Map<String, dynamic>> _options = [
    {
      'icon': Icons.play_circle_filled,
      'iconColor': Colors.red,
      'iconBgColor': Colors.transparent,
      'label': 'YouTube',
    },
    {
      'icon': Icons.search,
      'iconColor': Colors.white,
      'iconBgColor': Colors.blue,
      'label': 'Google Search',
    },
    {
      'icon': Icons.facebook,
      'iconColor': Colors.white,
      'iconBgColor': Colors.blue,
      'label': 'Facebook/Instagram',
    },
    {
      'icon': Icons.play_arrow,
      'iconColor': Colors.white,
      'iconBgColor': Colors.green,
      'label': 'App store',
    },
    {
      'icon': Icons.music_note,
      'iconColor': Colors.white,
      'iconBgColor': Colors.black,
      'label': 'TikTok',
    },
    {
      'icon': Icons.article,
      'iconColor': Colors.black,
      'iconBgColor': Colors.white,
      'label': 'News/article/blog',
    },
    {
      'icon': Icons.people,
      'iconColor': Colors.white,
      'iconBgColor': Colors.orange,
      'label': 'Friends/family',
    },
    {
      'icon': Icons.tv,
      'iconColor': Colors.white,
      'iconBgColor': Colors.grey[800]!,
      'label': 'TV',
    },
    {
      'icon': Icons.more_horiz,
      'iconColor': Colors.white,
      'iconBgColor': Colors.purple,
      'label': 'Other',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131F22), // Dark background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // List of options
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                itemCount: _options.length,
                itemBuilder: (context, index) {
                  final option = _options[index];
                  final isSelected = _selectedOption == index;

                  return OptionItem(
                    icon: option['icon'],
                    iconColor: option['iconColor'],
                    iconBgColor: option['iconBgColor'],
                    label: option['label'],
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        _selectedOption = index;
                      });
                    },
                  );
                },
              ),
            ),

            // Continue button
            Padding(
              padding: const EdgeInsets.all(20),
              child: PrimaryButton(text: 'CONTINUE', onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Option Item Widget
class OptionItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionItem({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: const Color(
                0xFF223438,
              ), // Slightly lighter than background
              borderRadius: BorderRadius.circular(12),
              border:
                  isSelected
                      ? Border.all(
                        color: const Color(0xFF58CC02),
                        width: 2,
                      ) // Green border when selected
                      : null,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Icon
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(icon, color: iconColor, size: 20),
                ),
                const SizedBox(width: 16),
                // Label
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // Checkbox when selected
                const Spacer(),
                if (isSelected)
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xFF58CC02), // Duolingo green
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
