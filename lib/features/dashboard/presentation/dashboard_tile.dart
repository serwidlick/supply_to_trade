import 'package:flutter/material.dart';

/// Dashboard tile for displaying quick actions
class DashboardTile extends StatelessWidget {
  /// Creates an instance of [DashboardTile].
  const DashboardTile({
    required this.icon,
    required this.title,
    required this.gradient,
    this.count,
    super.key,
  });

  /// Icon for the tile.
  final IconData icon;

  /// Title for the tile.
  final String title;

  /// Optional count for the tile, can be null.
  final String? count;

  /// Gradient colors for the tile background.
  final List<Color> gradient;

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colours.outline.withValues(alpha: 0.1)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$title tapped'),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colours.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: colours.primary, size: 24),
                    ),
                    if (count != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: colours.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          count ?? '',
                          style: TextStyle(
                            color: colours.onPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                Text(
                  title,
                  style: TextStyle(
                    color: colours.onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'View details',
                      style: TextStyle(
                        color: colours.onSurface.withValues(alpha: 0.6),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: colours.onSurface.withValues(alpha: 0.6),
                      size: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
