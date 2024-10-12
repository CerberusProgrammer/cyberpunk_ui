import 'package:flutter/material.dart';

enum CyberBorderType {
  left,
  right,
}

class CyberButtonShape extends CustomPainter {
  final Color outlineColor;
  final Color backgroundColor;
  final Color overlayColor;
  final CyberBorderType borderType;

  CyberButtonShape({
    required this.outlineColor,
    required this.backgroundColor,
    required this.overlayColor,
    required this.borderType,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();
    if (borderType == CyberBorderType.right) {
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height - 8);
      path.lineTo(size.width - 8, size.height);
      path.lineTo(0, size.height);
    } else {
      path.moveTo(8, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(8, size.height);
      path.lineTo(0, size.height - 8);
      path.lineTo(0, 0);
    }
    path.close();

    canvas.drawPath(path, paint);

    paint
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, paint);

    paint.color = overlayColor;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CyberButtonShape oldDelegate) {
    return oldDelegate.outlineColor != outlineColor ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.overlayColor != overlayColor ||
        oldDelegate.borderType != borderType;
  }
}
