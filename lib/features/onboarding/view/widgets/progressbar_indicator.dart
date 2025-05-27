import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressbarIndicator extends StatelessWidget
    implements PreferredSizeWidget {
  final int curretPage;
  final int totalPages;

  const ProgressbarIndicator({
    super.key,
    required this.curretPage,
    this.totalPages = 14,
  });

  @override
  Widget build(BuildContext context) {
    final percent = curretPage / totalPages;
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6),
          LinearPercentIndicator(
            lineHeight: 14.0,
            percent: percent.clamp(0.0, 1.0),
            progressColor: const Color.fromRGBO(147, 211, 51, 1),
            backgroundColor: Colors.white24,
            barRadius: const Radius.circular(10),
            animation: true,
            animateFromLastPercent: true,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
      toolbarHeight: 70,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
