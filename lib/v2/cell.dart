import 'package:cyberpunk_ui/v2/cell.shape.dart';
import 'package:flutter/material.dart';

class Cell extends StatefulWidget {
  final String text;
  final IconData? icon;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onTap;

  const Cell({
    super.key,
    required this.text,
    this.icon,
    this.color = const Color.fromARGB(255, 247, 79, 73),
    this.backgroundColor = const Color.fromARGB(255, 14, 14, 23),
    required this.onTap,
  });

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _controller;
  late Animation<Color?> _outlineColorTween;
  late Animation<Color?> _overlayColorTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    _outlineColorTween = ColorTween(
            begin: widget.color.withOpacity(0.3),
            end: widget.color.withOpacity(1))
        .animate(_controller);
    _overlayColorTween = ColorTween(
            begin: widget.color.withOpacity(0.0),
            end: widget.color.withOpacity(0.1))
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
        onTapUp: (details) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => CustomPaint(
            painter: CellShapePainter(
                outlineColor: _isPressed
                    ? widget.color.withOpacity(1)
                    : _outlineColorTween.value!,
                backgroundColor: widget.backgroundColor,
                overlayColor: _isPressed
                    ? widget.color.withOpacity(0.7)
                    : _overlayColorTween.value!),
            child: IntrinsicWidth(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.icon != null)
                      Icon(
                        widget.icon,
                        color: _isPressed ? Colors.black : widget.color,
                      ),
                    if (widget.icon != null) const SizedBox(width: 8.0),
                    Text(
                      widget.text,
                      style: TextStyle(
                        color: _isPressed ? Colors.black : widget.color,
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
