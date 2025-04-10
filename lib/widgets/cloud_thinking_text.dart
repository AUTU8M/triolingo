import 'package:flutter/material.dart';

class ClaudeStyleTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final String hintText;
  final FocusNode? focusNode;
  final VoidCallback? onTap;

  const ClaudeStyleTextField({
    super.key,
    this.controller,
    this.onSubmitted,
    this.hintText = "What would you like to learn?",
    this.focusNode,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Claude dark input bg
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade800),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              onTap: onTap,
              onSubmitted: onSubmitted,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.4,
              ),
              maxLines: null,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey.shade500),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(
              Icons.arrow_upward_rounded,
              color: Colors.white,
              size: 22,
            ),
            onPressed: () {
              if (controller != null && controller!.text.trim().isNotEmpty) {
                onSubmitted?.call(controller!.text.trim());
              }
            },
          ),
        ],
      ),
    );
  }
}
