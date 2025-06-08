import 'package:flutter/material.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colours.surface,
            colours.primary.withOpacity(0.03),
            colours.secondary.withOpacity(0.02),
          ],
        ),
      ),
      child: CustomPaint(
        painter: GeometricBackgroundPainter(colours),
        size: Size.infinite,
      ),
    );
  }
}

class GeometricBackgroundPainter extends CustomPainter {
  final ColorScheme colours;

  GeometricBackgroundPainter(this.colours);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..style = PaintingStyle.fill
          ..color = colours.primary.withOpacity(0.02);

    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.2), 100, paint);
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.8), 80, paint);

    paint.color = colours.secondary.withOpacity(0.01);
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.7), 120, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
