import 'package:flutter/material.dart';
import '../../../../core/theme/pallete.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double bottomPadding;
  const PrimaryButton({super.key, required this.text, required this.onPressed, this.bottomPadding = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, bottomPadding), // Add optional bottom padding
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(0, 44), // Standard button height
            backgroundColor: onPressed != null
                ? Pallete.buttonMainColor
                : Pallete.greyColor,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
