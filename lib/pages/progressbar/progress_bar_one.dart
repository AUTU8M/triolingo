import 'package:flutter/material.dart';

import 'package:triolingo/widgets/duolingo_logo.dart';

class ProgressBarOne extends StatelessWidget {
  const ProgressBarOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                DuolingoLogo(assetPath: 'assets/images/duo_birds/duobird6.svg'),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
