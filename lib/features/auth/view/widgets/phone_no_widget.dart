import 'package:flutter/material.dart';
import 'package:triolingo/core/theme/pallete.dart';

class PhoneNoWidget extends StatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController otpController;
  const PhoneNoWidget({
    super.key,
    required this.phoneController,
    required this.otpController,
  });

  @override
  State<PhoneNoWidget> createState() => _PhoneNoWidgetState();
}

class _PhoneNoWidgetState extends State<PhoneNoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Pallete.backgroundColor,
        border: Border.all(color: Pallete.borderColor, width: 1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(32, 47, 53, 1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    // Row with vertical divider
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 4.0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '+91',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: double.infinity,
                          child: VerticalDivider(
                            thickness: 1,
                            color: Pallete.borderColor,
                            indent: 0,
                            endIndent: 0,
                            width: 20,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextField(
                              controller: widget.phoneController,
                              style: TextStyle(
                                fontSize: 16,
                                color: Pallete.whiteColor,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Phone number',
                                hintStyle: TextStyle(color: Pallete.greyColor),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                isDense: true,
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text(
                                'GET CODE',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: Pallete.greyColor,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Horizontal divider at the bottom
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Divider(
                        thickness: 1,
                        color: Pallete.borderColor,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),

              // Right half
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                  ), // Added left padding for more gap
                  child: TextField(
                    controller: widget.otpController,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: 'Verification code',
                      hintStyle: TextStyle(color: Pallete.greyColor),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                    style: TextStyle(fontSize: 16, color: Pallete.greyColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
