import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CyberSlider extends StatefulWidget {
  const CyberSlider({super.key});

  @override
  State<CyberSlider> createState() => _CyberSliderState();
}

class _CyberSliderState extends State<CyberSlider> {
  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _sliderValue = (details.localPosition.dx / context.size!.width) * 100;
          if (_sliderValue < 0) _sliderValue = 0;
          if (_sliderValue > 100) _sliderValue = 100;
        });
      },
      child: CustomPaint(
        size: Size(double.infinity, 100),
        painter: SliderPainter(
          value: _sliderValue,
          thumbBackgroundColor: const Color.fromARGB(255, 83, 6, 1),
          thumbOutlineColor: Colors.red,
          linearFillColor: Colors.red,
          linearOutlineColor: const Color.fromARGB(255, 78, 47, 45),
          thumbText: '1',
          thumbTextColor: Colors.cyan,
        ),
      ),
    );
  }
}

class SliderPainter extends CustomPainter {
  final double value;
  final Color thumbBackgroundColor;
  final Color thumbOutlineColor;
  final Color linearFillColor;
  final Color linearOutlineColor;
  final String thumbText;
  final Color thumbTextColor;

  SliderPainter({
    required this.value,
    required this.thumbBackgroundColor,
    required this.thumbOutlineColor,
    required this.linearFillColor,
    required this.linearOutlineColor,
    required this.thumbText,
    required this.thumbTextColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final outlinePaint = Paint()
      ..color = linearOutlineColor
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..color = linearFillColor
      ..style = PaintingStyle.fill;

    final thumbOutlinePaint = Paint()
      ..color = thumbOutlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final thumbBackgroundPaint = Paint()
      ..color = thumbBackgroundColor
      ..style = PaintingStyle.fill;

    canvas.drawLine(Offset(0, size.height / 2),
        Offset(size.width, size.height / 2), outlinePaint);

    canvas.drawLine(Offset(0, size.height / 2),
        Offset(value / 100 * size.width, size.height / 2), fillPaint);

    final thumbWidth = 60.0;
    final thumbHeight = 30.0;
    final thumbCenter = Offset(value / 100 * size.width, size.height / 2);
    final thumbPath = Path()
      ..moveTo(
          thumbCenter.dx - thumbWidth / 2, thumbCenter.dy - thumbHeight / 2)
      ..lineTo(
          thumbCenter.dx + thumbWidth / 2, thumbCenter.dy - thumbHeight / 2)
      ..lineTo(
          thumbCenter.dx + thumbWidth / 2, thumbCenter.dy + thumbHeight / 2 - 8)
      ..lineTo(
          thumbCenter.dx + thumbWidth / 2 - 8, thumbCenter.dy + thumbHeight / 2)
      ..lineTo(
          thumbCenter.dx - thumbWidth / 2, thumbCenter.dy + thumbHeight / 2)
      ..close();

    canvas.drawPath(thumbPath, thumbBackgroundPaint);

    canvas.drawPath(thumbPath, thumbOutlinePaint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: thumbText,
        style: TextStyle(color: thumbTextColor, fontSize: 16),
      ),
      textDirection: ui.TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas,
        thumbCenter - Offset(textPainter.width / 2, textPainter.height / 2));

    final valueTextPainter = TextPainter(
      text: TextSpan(
        text: value.round().toString(),
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      textDirection: ui.TextDirection.ltr,
    );
    valueTextPainter.layout();
    valueTextPainter.paint(canvas,
        thumbCenter - Offset(valueTextPainter.width / 2, thumbHeight / 2 + 20));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
