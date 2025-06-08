import 'package:flutter/material.dart';
import 'package:supply_to_trade/features/dashboard/presentation/notification_card.dart';

class NotificationsSection extends StatelessWidget {
  const NotificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: colours.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Recent Activity',
                  style: TextStyle(
                    color: colours.onSurface,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View all',
                style: TextStyle(
                  color: colours.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        NotificationCard(
          title: 'Order Received',
          message:
              'Thank you for your order, please wait 24 hours for a response',
          icon: Icons.shopping_bag_outlined,
          time: '2 hours ago',
        ),
        const SizedBox(height: 12),
        NotificationCard(
          title: 'Quote Received',
          message:
              'Thank you for your quotation, please wait 24 hours for a response',
          icon: Icons.request_quote_outlined,
          time: '5 hours ago',
        ),
      ],
    );
  }
}
