import 'package:flutter/material.dart';

/// Animated Background class used for the dashboard
class AnimatedBackground extends StatelessWidget {
  /// const constructor for [AnimatedBackground]
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
            colours.primary.withValues(alpha: 0.03),
            colours.secondary.withValues(alpha: 0.02),
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

/// Custom painter for the geometric background
class GeometricBackgroundPainter extends CustomPainter {
  /// Creates a [GeometricBackgroundPainter] with the given [colours].
  GeometricBackgroundPainter(this.colours);

  /// Creates a [GeometricBackgroundPainter] with the given [colours].
  final ColorScheme colours;

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..style = PaintingStyle.fill
          ..color = colours.primary.withValues(alpha: 0.02);

    canvas
      ..drawCircle(Offset(size.width * 0.8, size.height * 0.2), 100, paint)
      ..drawCircle(Offset(size.width * 0.2, size.height * 0.8), 80, paint);

    paint.color = colours.secondary.withValues(alpha: 0.01);
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.7), 120, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
