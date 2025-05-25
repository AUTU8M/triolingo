import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  /// The message text to display in the bubble
  final String message;

  /// Background color of the bubble
  final Color backgroundColor;

  /// Border color of the bubble
  final Color borderColor;

  /// Text color
  final Color textColor;

  /// Maximum width of the bubble
  final double? maxWidth;

  /// Padding inside the bubble
  final EdgeInsetsGeometry padding;

  /// Border radius of the bubble corners
  final double borderRadius;

  /// Size of the text
  final double fontSize;

  /// Width of the border line
  final double borderWidth;

  /// Whether to show the tail on the left side
  final bool showTail;

  /// Size of the tail
  final Size tailSize;

  /// Additional widget to display in the bubble (optional)
  final Widget? child;

  /// Text style for the message
  final TextStyle? textStyle;

  const ChatBubble({
    super.key,
    this.message = '',
    this.backgroundColor = const Color.fromRGBO(19, 31, 34, 1),
    this.borderColor = const Color(0xFF30363D),
    this.textColor = Colors.white,
    this.maxWidth,
    this.padding = const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
    this.borderRadius = 20.0,
    this.fontSize = 15.0,
    this.borderWidth = 1.0,
    this.showTail = true,
    this.tailSize = const Size(10, 16),
    this.child,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // The tail/pointer on the left (only if showTail is true)
        if (showTail)
          CustomPaint(
            size: tailSize,
            painter: BubbleTailPainter(
              backgroundColor: backgroundColor,
              borderColor: borderColor,
              borderWidth: borderWidth,
            ),
          ),

        // The bubble container
        Flexible(
          child: Container(
            constraints:
                maxWidth != null ? BoxConstraints(maxWidth: maxWidth!) : null,
            padding: padding,
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child:
                child ??
                Text(
                  message,
                  style:
                      textStyle ??
                      TextStyle(
                        color: textColor,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w400,
                      ),
                ),
          ),
        ),
      ],
    );
  }
}

class BubbleTailPainter extends CustomPainter {
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;

  BubbleTailPainter({
    required this.backgroundColor,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Background fill
    final Paint fillPaint =
        Paint()
          ..color = backgroundColor
          ..style = PaintingStyle.fill;

    final Path fillPath =
        Path()
          ..moveTo(size.width, size.height * 0.3)
          ..lineTo(0, size.height * 0.5)
          ..lineTo(size.width, size.height * 0.7)
          ..close();

    canvas.drawPath(fillPath, fillPaint);

    // Border
    final Paint borderPaint =
        Paint()
          ..color = borderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = borderWidth
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round;

    final Path borderPath =
        Path()
          ..moveTo(size.width, size.height * 0.3)
          ..lineTo(0, size.height * 0.5)
          ..lineTo(size.width, size.height * 0.7);

    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
