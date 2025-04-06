import 'package:flutter/material.dart';

class PopupTextMessage extends StatelessWidget {
  final String message;
  final Color borderColor;
  final double borderWidth;
  final EdgeInsets padding;
  final TextStyle textStyle;
  final double tailWidth;
  final double tailHeight;
  final double borderRadius;
  final double maxWidth;
  final double tailPositionRatio; // 0.0 to 1.0, where tail is positioned

  const PopupTextMessage({
    required this.message,
    this.borderColor = Colors.white,
    this.borderWidth = 2.0,
    this.padding = const EdgeInsets.fromLTRB(16, 12, 16, 12),
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 16),
    this.tailWidth = 20,
    this.tailHeight = 15,
    this.borderRadius = 16,
    this.maxWidth = 250,
    this.tailPositionRatio = 0.5,
    super.key, // Default centered tail
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final effectiveMaxWidth =
            constraints.maxWidth > 0 && constraints.maxWidth < maxWidth
                ? constraints.maxWidth
                : maxWidth;

        return Container(
          constraints: BoxConstraints(maxWidth: effectiveMaxWidth),
          child: CustomPaint(
            painter: AnchoredTailBubblePainter(
              borderColor: borderColor,
              borderWidth: borderWidth,
              borderRadius: borderRadius,
              tailWidth: tailWidth,
              tailHeight: tailHeight,
              tailPositionRatio: tailPositionRatio,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: padding.top,
                left: padding.left,
                right: padding.right,
                bottom: padding.bottom + tailHeight,
              ),
              child: Text(
                message,
                style: textStyle,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ),
        );
      },
    );
  }
}

class AnchoredTailBubblePainter extends CustomPainter {
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final double tailWidth;
  final double tailHeight;
  final double tailPositionRatio;

  AnchoredTailBubblePainter({
    required this.borderColor,
    required this.borderWidth,
    required this.borderRadius,
    required this.tailWidth,
    required this.tailHeight,
    required this.tailPositionRatio,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint =
        Paint()
          ..color = Colors.transparent
          ..style = PaintingStyle.fill;

    final Paint borderPaint =
        Paint()
          ..color = borderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = borderWidth;

    // Calculate bubble height (excluding tail)
    final double bubbleHeight = size.height - tailHeight;

    // Calculate tail position (x coordinate)
    final double tailPositionX = size.width * tailPositionRatio;

    // Create bubble path with rounded corners
    final Path path = Path();

    // Top left corner
    path.moveTo(borderRadius, 0);

    // Top line and top right corner
    path.lineTo(size.width - borderRadius, 0);
    path.arcToPoint(
      Offset(size.width, borderRadius),
      radius: Radius.circular(borderRadius),
    );

    // Right line and bottom right corner
    path.lineTo(size.width, bubbleHeight - borderRadius);
    path.arcToPoint(
      Offset(size.width - borderRadius, bubbleHeight),
      radius: Radius.circular(borderRadius),
    );

    // Bottom line right part (to tail)
    path.lineTo(tailPositionX + (tailWidth / 2), bubbleHeight);

    // Tail
    path.lineTo(tailPositionX, size.height);
    path.lineTo(tailPositionX - (tailWidth / 2), bubbleHeight);

    // Bottom line left part (from tail)
    path.lineTo(borderRadius, bubbleHeight);

    // Bottom left corner
    path.arcToPoint(
      Offset(0, bubbleHeight - borderRadius),
      radius: Radius.circular(borderRadius),
    );

    // Left line and top left corner
    path.lineTo(0, borderRadius);
    path.arcToPoint(
      Offset(borderRadius, 0),
      radius: Radius.circular(borderRadius),
    );

    // Close the path
    path.close();

    // Draw the bubble
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
