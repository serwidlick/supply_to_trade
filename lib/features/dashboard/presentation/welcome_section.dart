import 'package:flutter/material.dart';

/// WelcomeSection class used for displaying the welcome section in the dashboard
class WelcomeSection extends StatelessWidget {
  /// Creates an instance of [WelcomeSection].
  const WelcomeSection({super.key, this.onDismissed});

  /// Callback function when the section is dismissed
  final VoidCallback? onDismissed;

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colours.primary.withOpacity(0.1),
            colours.primary.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colours.primary.withOpacity(0.1)),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back',
                style: TextStyle(
                  color: colours.onSurface.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Dashboard Overview',
                style: TextStyle(
                  color: colours.onSurface,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Manage your quotes, orders, and stay connected',
                style: TextStyle(
                  color: colours.onSurface.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: colours.onSurface.withOpacity(0.6),
              ),
              onPressed: onDismissed,
              tooltip: 'Dismiss',
            ),
          ),
        ],
      ),
    );
  }
}
