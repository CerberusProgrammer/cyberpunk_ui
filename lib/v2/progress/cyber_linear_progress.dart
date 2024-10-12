import 'package:flutter/material.dart';

class CyberLinearProgress extends StatefulWidget {
  final Widget? title;
  final double? value;
  final Color? backgroundColor;
  final Color? valueColor;
  final double height;
  final bool hidePercentage;

  const CyberLinearProgress({
    super.key,
    this.title,
    this.value,
    this.backgroundColor = const Color.fromARGB(65, 247, 79, 73),
    this.valueColor = const Color.fromARGB(255, 247, 79, 73),
    this.hidePercentage = false,
    this.height = 6,
  }) : assert(value == null || (value >= 0.0 && value <= 1.0));

  @override
  State<CyberLinearProgress> createState() => _CyberLinearProgressState();
}

class _CyberLinearProgressState extends State<CyberLinearProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    if (widget.value == null) {
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..repeat();
      _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
        ..addListener(() {
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  textStyle: TextStyle(
                    color: widget.valueColor,
                    fontWeight: FontWeight.bold,
                  ),
                  color: Colors.transparent,
                  child: widget.title!,
                ),
              ],
            ),
          ),
        CustomPaint(
          painter: _CyberLinearProgressPainter(
            value: widget.value ?? _animation.value,
            backgroundColor: widget.backgroundColor!,
            valueColor: widget.valueColor!,
          ),
          child: Container(
            height: widget.height,
          ),
        ),
        if (!widget.hidePercentage)
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 4.0),
            child: Text(
              '${((widget.value ?? _animation.value) * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                color: widget.valueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}

class _CyberLinearProgressPainter extends CustomPainter {
  final double value;
  final Color backgroundColor;
  final Color valueColor;

  _CyberLinearProgressPainter({
    required this.value,
    required this.backgroundColor,
    required this.valueColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    paint.color = valueColor;
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width * value, size.height), paint);
  }

  @override
  bool shouldRepaint(_CyberLinearProgressPainter oldDelegate) {
    return oldDelegate.value != value ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.valueColor != valueColor;
  }
}
