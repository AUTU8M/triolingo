import 'package:flutter/material.dart';

class OutlinedtypaButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Icon buttonIcon;
  const OutlinedtypaButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonIcon,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white10,
          side: BorderSide(color: Color.fromARGB(255, 78, 78, 78), width: 1.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonIcon,
            const SizedBox(width: 9),
            Text(
              text,
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 202, 199, 199),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
