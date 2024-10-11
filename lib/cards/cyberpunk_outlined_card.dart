import 'package:flutter/material.dart';

class CyberpunkOutlinedCardPainter extends CustomPainter {
  final Color color;

  CyberpunkOutlinedCardPainter({required this.color});

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

    final fillPaint = Paint()
      ..color = color.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(CyberpunkOutlinedCardPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class CyberpunkOutlinedCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String content;
  final IconData? icon;
  final Color accentColor;

  const CyberpunkOutlinedCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
    this.icon,
    this.accentColor = Colors.redAccent,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CyberpunkOutlinedCardPainter(color: accentColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: constraints.maxWidth / 4,
                    child: Divider(
                      thickness: 5,
                      color: accentColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    title,
                    style: TextStyle(
                      color: accentColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              if (icon != null)
                Icon(
                  icon,
                  color: accentColor,
                  size: 32,
                ),
              Text(
                subtitle,
                style: TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                content,
                style: TextStyle(
                  color: accentColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
