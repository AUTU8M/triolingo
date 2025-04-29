// Reusable chat header component
import 'package:flutter/material.dart';

import 'package:triolingo/widgets/cloud_thinking_text.dart';
import 'package:triolingo/widgets/duolingo_logo.dart';

class ChatHeader extends StatelessWidget {
  final String message;
  final String? assetPath;

  const ChatHeader({
    super.key,
    required this.message,
    this.assetPath = 'assets/images/duo_birds/duobird6.svg',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          DuolingoLogo(assetPath: assetPath!),
          const SizedBox(width: 16),
          ChatBubble(message: message),
        ],
      ),
    );
  }
}
