import 'package:flutter/material.dart';
import '../../../../core/theme/pallete.dart';

class OutlinedtypaButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const OutlinedtypaButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0), // Consistent horizontal padding
      child: SizedBox(
        width: double.infinity,
        height: 44, // Match PrimaryButton height
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: Pallete.buttonMainColor,
            side: const BorderSide(color: Color.fromARGB(255, 66, 66, 65), width: 1.7),
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
