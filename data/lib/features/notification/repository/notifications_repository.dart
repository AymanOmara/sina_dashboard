import 'package:data/features/notification/model/notification_model.dart';
import 'package:data/features/notification/requests/get_my_notifications_request.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/notifications/entity/notification_entity.dart';
import 'package:domain/features/notifications/repository/i_notifications_repository.dart';
import 'package:domain/locale_storage/i_user_local.dart';

class NotificationsRepository implements INotificationsRepository {
  final IAPIService _iApiService;
  final IUserLocal _userLocal;

  const NotificationsRepository(
    this._iApiService,
    this._userLocal,
  );

  @override
  Future<Result<List<NotificationEntity>, NetworkException>>
      fetchNotifications() async {
    var result = await _iApiService.fetchData<NotificationsModel>(
      GetMyNotificationRequest(
        userID: _userLocal.getUser()?.userId ?? 0,
      ),
      data: NotificationsModel(),
    );
    return result.fold(onSuccess: (data) {
      return Success(
        data?.notifications?.map((e) => e.toEntity()).toList() ?? [],
      );
    }, onFailure: (e) {
      return Failure(e);
    });
  }
}
