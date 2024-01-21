import 'package:flutter/material.dart';

class CyberpunkFilledCardPainter extends CustomPainter {
  final Color color;

  CyberpunkFilledCardPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 12);
    path.lineTo(size.width - 12, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CyberpunkFilledCardPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class CyberpunkFilledCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String content;
  final IconData? icon;
  final Color accentColor;

  const CyberpunkFilledCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.content,
    this.icon,
    this.accentColor = Colors.redAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CyberpunkFilledCardPainter(color: accentColor),
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
                    child: const Divider(
                      thickness: 5,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.black,
                  size: 32,
                ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                content,
                style: const TextStyle(
                  color: Colors.black,
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
