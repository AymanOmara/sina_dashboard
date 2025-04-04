import 'package:domain/features/notifications/entity/notification_entity.dart';
import 'package:flutter/material.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.notification,
  });

  final NotificationEntity notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      margin: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            12,
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            notification.content,
            style: TextStyle(
              color: orangeColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 14,
          ),
          Text(
            notification.time,
            style: TextStyle(
              color: blue,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
