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
  final bool showDecorationLine;
  final double decorationLineLength;

  CyberButtonShape({
    required this.outlineColor,
    required this.backgroundColor,
    required this.overlayColor,
    required this.borderType,
    this.showDecorationLine = false,
    this.decorationLineLength = 20,
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

    if (showDecorationLine) {
      paint
        ..color = outlineColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;

      final linePath = Path();
      if (borderType == CyberBorderType.right) {
        linePath.moveTo(size.width, size.height / 2);
        linePath.lineTo(size.width - decorationLineLength, size.height / 2);
      } else {
        linePath.moveTo(0, size.height / 2);
        linePath.lineTo(decorationLineLength, size.height / 2);
      }
      canvas.drawPath(linePath, paint);
    }
  }

  @override
  bool shouldRepaint(CyberButtonShape oldDelegate) {
    return oldDelegate.outlineColor != outlineColor ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.overlayColor != overlayColor ||
        oldDelegate.borderType != borderType ||
        oldDelegate.showDecorationLine != showDecorationLine;
  }
}
