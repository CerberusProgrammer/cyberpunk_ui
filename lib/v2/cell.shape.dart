import 'package:flutter/material.dart';

class CellShapePainter extends CustomPainter {
  final Color outlineColor;
  final Color backgroundColor;
  final Color overlayColor;

  CellShapePainter({
    required this.outlineColor,
    required this.backgroundColor,
    required this.overlayColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 8);
    path.lineTo(size.width - 8, size.height);
    path.lineTo(0, size.height);
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
  bool shouldRepaint(CellShapePainter oldDelegate) {
    return oldDelegate.outlineColor != outlineColor ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.overlayColor != overlayColor;
  }
}
