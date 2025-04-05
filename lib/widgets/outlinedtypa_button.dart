import 'package:flutter/material.dart';
import 'package:triolingo/theme/pallete.dart';

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
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Pallete.buttonMainColor,
          side: BorderSide(
            color: Color.fromARGB(255, 135, 219, 71),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
