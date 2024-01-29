import 'package:flutter/material.dart';

class CyberpunkOutlinedButtonPainter extends CustomPainter {
  final Color color;

  CyberpunkOutlinedButtonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 12);
    path.lineTo(size.width - 12, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);

    paint
      ..color = color.withOpacity(0.2)
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CyberpunkOutlinedButtonPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class CyberpunkOutlinedButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final Color accentColor;
  final Color onHoverColor;
  final Color onClickColor;
  final VoidCallback onTap;

  const CyberpunkOutlinedButton({
    Key? key,
    required this.text,
    this.accentColor = Colors.redAccent,
    this.onHoverColor = Colors.blue,
    this.onClickColor = Colors.blueAccent,
    required this.onTap,
    this.icon,
  }) : super(key: key);

  const CyberpunkOutlinedButton.icon({
    Key? key,
    required this.text,
    required this.icon,
    this.accentColor = Colors.redAccent,
    this.onHoverColor = const Color.fromARGB(255, 30, 43, 53),
    this.onClickColor = Colors.blueAccent,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CyberpunkOutlinedButton> createState() =>
      _CyberpunkOutlinedButtonState();
}

class _CyberpunkOutlinedButtonState extends State<CyberpunkOutlinedButton>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _controller;
  late Animation _colorTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _colorTween =
        ColorTween(begin: widget.accentColor, end: widget.onHoverColor)
            .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        _controller.forward();
      },
      onExit: (event) {
        _controller.reverse();
      },
      child: GestureDetector(
        onTapDown: (details) => setState(() => _isPressed = true),
        onTapUp: (details) {
          setState(() => _isPressed = false);
          _controller.reverse(); // Añade esta línea
        },
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _colorTween,
          builder: (context, child) => CustomPaint(
            painter: CyberpunkOutlinedButtonPainter(
                color: _isPressed ? widget.onClickColor : _colorTween.value),
            child: IntrinsicWidth(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 8,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.icon != null)
                      Icon(widget.icon,
                          color: _isPressed
                              ? widget.onClickColor
                              : _colorTween.value),
                    if (widget.icon != null) const SizedBox(width: 8.0),
                    Text(
                      widget.text,
                      style: TextStyle(
                        color: _isPressed
                            ? widget.onClickColor
                            : _colorTween.value,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
