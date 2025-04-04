import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/notifications/entity/notification_entity.dart';

abstract interface class INotificationsRepository{
  Future<Result<List<NotificationEntity>,NetworkException>> fetchNotifications();
}