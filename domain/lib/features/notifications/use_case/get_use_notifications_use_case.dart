import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/notifications/entity/notification_entity.dart';
import 'package:domain/features/notifications/repository/i_notifications_repository.dart';

class GetUserNotificationsUseCase {
  final INotificationsRepository _notificationsRepository;

  const GetUserNotificationsUseCase(this._notificationsRepository);

  Future<Result<List<NotificationEntity>, NetworkException>> call() async {
    return await _notificationsRepository.fetchNotifications();
  }
}
