import 'package:flutter/material.dart';
import 'package:triolingo/core/theme/pallete.dart';

class PhoneNoWidget extends StatelessWidget {
  const PhoneNoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Pallete.greyColor, width: 1),
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Phone Number',
                style: TextStyle(fontSize: 16, color: Pallete.greyColor),
              ),
            ),
          ),

          /// Vertical Divider
          Divider(
            thickness: 1,
            color: Pallete.borderColor, // Use exact color here
            indent: 0,
            endIndent: 0,
          ),
          // Right half
          Expanded(
            child: Center(
              child: Text(
                'Verification Code',
                style: TextStyle(fontSize: 16, color: Pallete.greyColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
