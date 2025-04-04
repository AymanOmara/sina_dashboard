import 'dart:convert';

import 'package:data/network/decode_able.dart';
import 'package:domain/features/notifications/entity/notification_entity.dart';
import 'package:xml/xml.dart';

class NotificationsModel implements DecodeAble<NotificationsModel, List> {
  List<NotificationModel>? notifications = [];

  NotificationsModel({
    this.notifications,
  });

  @override
  NotificationsModel fromJson(List json) {
    notifications = json.map((e) => NotificationModel.fromJson(e)).toList();
    return NotificationsModel(
      notifications: notifications,
    );
  }
}

class NotificationModel
    implements DecodeAble<NotificationModel, Map<String, dynamic>> {
  String? time;
  String? content;
  int? id;
  String? timeMark;
  String? isRead;

  NotificationModel({
    this.content,
    this.time,
    this.id,
    this.timeMark,
    this.isRead,
  });

  @override
  NotificationModel fromJson(Map<String, dynamic> json) {
    return NotificationModel.fromJson(json);
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      time: json["notificationtime"],
      content: json["notificationtext"],
      id: json["notificationid"],
      timeMark: json["timemark"],
      isRead: json["isread"],
    );
  }

  NotificationEntity toEntity() {
    return NotificationEntity(
      content: content ?? "",
      time: time ?? "",
      id: id ?? 0,
      timeMark: timeMark ?? "",
      isRead: isRead ?? "",
    );
  }
}
