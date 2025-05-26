import 'package:flutter/material.dart';

class ProgressListTileSecond extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final String text;
  final String text1;
  final bool isSelected;
  final VoidCallback onTap;

  const ProgressListTileSecond({
    super.key,
    this.icon,
    this.iconColor,
    required this.text,
    required this.text1,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),

        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? const Color.fromARGB(51, 128, 193, 236)
                    : const Color.fromRGBO(19, 31, 34, 1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:
                  isSelected
                      ? const Color.fromARGB(255, 60, 136, 172)
                      : const Color.fromARGB(255, 56, 62, 70),
              width: 1.3,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: iconColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(icon, color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                text1,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
