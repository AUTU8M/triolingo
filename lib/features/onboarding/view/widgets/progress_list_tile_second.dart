import 'package:flutter/material.dart';

class ProgressListTileSecond extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final String text;
  final String text1;
  final bool isSelected;
  final VoidCallback onTap;
  final double height;
  final double width;
  final double iconsize;
  final double sizeboxheight;
  final double bordeRadiousWidth;
  final Color borderColor;

  const ProgressListTileSecond({
    super.key,
    this.icon,
    this.iconColor,
    required this.text,
    required this.text1,
    required this.isSelected,
    required this.onTap,
    this.height = 24,
    this.width = 36,
    this.iconsize = 25,
    this.sizeboxheight = 0,
    this.bordeRadiousWidth = 0,
    this.borderColor = Colors.transparent,
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
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: bordeRadiousWidth, color: borderColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      color: iconColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(icon, color: Colors.blue, size: iconsize),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: sizeboxheight),
                        Text(
                          text1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
