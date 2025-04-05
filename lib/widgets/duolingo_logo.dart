import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:triolingo/theme/pallete.dart';

class DuolingoLogo extends StatefulWidget {
  const DuolingoLogo({super.key});

  @override
  State<DuolingoLogo> createState() => _DuolingoLogoState();
}

class _DuolingoLogoState extends State<DuolingoLogo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //owl image
        SvgPicture.asset(
          'assets/images/duo_birds/duobirdDefult.svg',
          height: 100,
          width: 100,
        ),

        const SizedBox(height: 10),
        Text(
          'triolingo',
          style: TextStyle(
            fontFamily: 'Feather',
            fontSize: 40,
            color: Pallete.buttonMainColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
