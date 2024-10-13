import 'package:cyberpunk_ui/v2/decorations/assembly_decoration_shape.dart';
import 'package:flutter/material.dart';

class AssemblyDecoration extends StatefulWidget {
  final Color color;
  final bool isHovered;

  const AssemblyDecoration({
    super.key,
    required this.color,
    this.isHovered = false,
  });

  @override
  State<AssemblyDecoration> createState() => _AssemblyDecorationState();
}

class _AssemblyDecorationState extends State<AssemblyDecoration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    _colorTween = ColorTween(
            begin: widget.color.withOpacity(0.3),
            end: widget.color.withOpacity(1))
        .animate(_controller);

    if (widget.isHovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void didUpdateWidget(covariant AssemblyDecoration oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isHovered != oldWidget.isHovered) {
      if (widget.isHovered) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => CustomPaint(
          painter: AssemblyDecorationShape(
            outlineColor: _colorTween.value ?? widget.color,
          ),
          child: IntrinsicWidth(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
