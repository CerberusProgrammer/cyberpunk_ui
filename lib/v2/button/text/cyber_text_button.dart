import 'package:cyberpunk_ui/v2/button/cyber_button_shape.dart';
import 'package:flutter/material.dart';

class CyberTextButton extends StatefulWidget {
  final String? title;
  final IconData? icon;
  final Color foregroundColor;
  final Color outlineColor;
  final Color backgroundColor;
  final Color onClickedColor;
  final CyberBorderType borderType;
  final VoidCallback onTap;

  const CyberTextButton({
    super.key,
    this.title,
    this.icon,
    this.foregroundColor = const Color.fromARGB(255, 94, 247, 255),
    this.outlineColor = const Color.fromARGB(255, 247, 79, 73),
    this.backgroundColor = const Color.fromARGB(255, 14, 14, 23),
    this.onClickedColor = const Color.fromARGB(255, 14, 14, 23),
    this.borderType = CyberBorderType.right,
    required this.onTap,
  });

  @override
  State<CyberTextButton> createState() => _CyberTextButtonState();
}

class _CyberTextButtonState extends State<CyberTextButton>
    with SingleTickerProviderStateMixin {
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
            begin: widget.outlineColor.withOpacity(0.3),
            end: widget.outlineColor.withOpacity(1))
        .animate(_controller);
    _overlayColorTween = ColorTween(
            begin: widget.outlineColor.withOpacity(0.0),
            end: widget.outlineColor.withOpacity(0.1))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1),
      child: MouseRegion(
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
              painter: CyberButtonShape(
                outlineColor: _isPressed
                    ? widget.outlineColor.withOpacity(1)
                    : _outlineColorTween.value!,
                backgroundColor: widget.backgroundColor,
                overlayColor: _isPressed
                    ? widget.outlineColor.withOpacity(0.7)
                    : _overlayColorTween.value!,
                borderType: widget.borderType,
              ),
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
                          color: _isPressed
                              ? widget.onClickedColor
                              : widget.foregroundColor,
                        ),
                      if (widget.icon != null) const SizedBox(width: 8.0),
                      if (widget.title != null)
                        Text(
                          widget.title!,
                          style: TextStyle(
                            color: _isPressed
                                ? widget.onClickedColor
                                : widget.foregroundColor,
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
      ),
    );
  }
}
