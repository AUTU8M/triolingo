import 'package:flutter/material.dart';

class EmptyOutlinebutton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double height;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderWidth;
  final EdgeInsetsGeometry padding;
  final IconData? icon;

  const EmptyOutlinebutton({
    required this.text,
    required this.onPressed,
    this.height = 52,
    this.borderRadius = 12,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.borderWidth = 1.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null;
    final borderColor =
        isEnabled ? Colors.white.withOpacity(0.3) : Colors.grey[600]!;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onPressed,
          child: SizedBox(
            width: double.infinity,
            height: height,
            child: Padding(
              padding: padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: isEnabled ? Colors.white : Colors.grey[600]!,
                          width: 1.5,
                        ),
                      ),
                      child: Icon(icon, color: Colors.white, size: 22),
                    ),
                    const SizedBox(width: 16),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      color: isEnabled ? Colors.white : Colors.grey[600]!,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
