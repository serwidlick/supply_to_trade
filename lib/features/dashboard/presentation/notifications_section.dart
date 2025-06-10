// Ignoring because its temporary and will be removed in the future.
// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:supply_to_trade/features/dashboard/presentation/notification_card.dart';

/// NotificationsSection class used for displaying recent activity notifications
class NotificationsSection extends StatelessWidget {
  /// Creates an instance of [NotificationsSection].
  const NotificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colours = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
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
          const NotificationCard(
            title: 'Order Received',
            message:
                'Thank you for your order, please wait 24 hours for a response',
            icon: Icons.shopping_bag_outlined,
            time: '2 hours ago',
          ),
          const NotificationCard(
            title: 'Quote Received',
            message:
                'Thank you for your quotation, please wait 24 hours for a response',
            icon: Icons.request_quote_outlined,
            time: '5 hours ago',
          ),
        ],
      ),
    );
  }
}
