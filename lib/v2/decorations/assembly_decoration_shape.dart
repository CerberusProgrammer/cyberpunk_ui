import 'package:flutter/material.dart';

class AssemblyDecorationShape extends CustomPainter {
  final Color outlineColor;

  AssemblyDecorationShape({
    required this.outlineColor,
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

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(AssemblyDecorationShape oldDelegate) {
    return oldDelegate.outlineColor != outlineColor;
  }
}
