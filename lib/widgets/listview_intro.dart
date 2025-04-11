import 'package:flutter/material.dart';

class ListviewIntro extends StatelessWidget {
  final String text;
  const ListviewIntro({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, top: 16.0, bottom: 8.0),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
