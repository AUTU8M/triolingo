import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DuolingoLogo extends StatelessWidget {
  final String assetPath;
  final double height;
  final double width;

  const DuolingoLogo({
    super.key,
    required this.assetPath,
    this.height = 100,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetPath, height: height, width: width);
  }
}
