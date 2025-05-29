import 'package:flutter/material.dart';

class PhoneInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C252C),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF3A4A5C), width: 1),
      ),
      child: Column(
        children: [
          // Phone number input row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '+91',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ),
                VerticalDivider(
                  color: Color(0xFF3A4A5C),
                  thickness: 1,
                  width: 20,
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    decoration: InputDecoration(
                      hintText: 'Phone number',
                      hintStyle: TextStyle(color: Colors.white38, fontSize: 16),
                      border: InputBorder.none,
                      isCollapsed: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Text(
                  'GET CODE',
                  style: TextStyle(
                    color: Colors.white30,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          Divider(
            color: Color(0xFF3A4A5C),
            height: 1,
            thickness: 1,
            indent: 12,
            endIndent: 12,
          ),

          // Verification code input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: TextField(
              style: TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Verification code',
                hintStyle: TextStyle(color: Colors.white38, fontSize: 16),
                border: InputBorder.none,
                isCollapsed: true,
                contentPadding: EdgeInsets.zero,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }
}
