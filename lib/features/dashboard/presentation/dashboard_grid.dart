import 'package:flutter/material.dart';
import 'package:supply_to_trade/features/dashboard/presentation/dashboard_tile.dart';

/// DashboardGrid class used for displaying quick actions in a grid format
class DashboardGrid extends StatelessWidget {
  /// Creates an instance of [DashboardGrid].
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.dashboard_outlined, color: colours.primary, size: 20),
            const SizedBox(width: 8),
            Text(
              'Quick Actions',
              style: TextStyle(
                color: colours.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.count(
          padding: EdgeInsets.zero,
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 1.1,
          children: [
            DashboardTile(
              icon: Icons.request_quote_outlined,
              title: 'Quotes',
              count: '241',
              gradient: [
                colours.primary.withValues(alpha: 0.1),
                colours.primary.withValues(alpha: 0.05),
              ],
            ),
            DashboardTile(
              icon: Icons.shopping_bag_outlined,
              title: 'Orders',
              count: '21',
              gradient: [
                colours.secondary.withValues(alpha: 0.1),
                colours.secondary.withValues(alpha: 0.05),
              ],
            ),
            DashboardTile(
              icon: Icons.person_outline,
              title: 'My Info',
              gradient: [
                colours.tertiary.withValues(alpha: 0.1),
                colours.tertiary.withValues(alpha: 0.05),
              ],
            ),
            DashboardTile(
              icon: Icons.headset_mic_outlined,
              title: 'Contact Us',
              gradient: [
                colours.surfaceContainerHighest,
                colours.surfaceContainerHighest.withValues(alpha: 0.5),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
