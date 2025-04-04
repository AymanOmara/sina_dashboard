import 'package:bloc/bloc.dart';
import 'package:domain/features/notifications/entity/notification_entity.dart';
import 'package:domain/features/notifications/use_case/get_use_notifications_use_case.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(
    this._getUserNotificationsUseCase,
  ) : super(NotificationInitial()) {
    fetchNotifications();
  }

  LoadingState loading = Loading();
  final GetUserNotificationsUseCase _getUserNotificationsUseCase;
  List<NotificationEntity> notifications = [];

  void fetchNotifications() {
    loading = Loading();
    emit(NotificationInitial());
    _getUserNotificationsUseCase().then((value) {
      value.fold(onSuccess: (data) {
        notifications = data;
        loading = LoadingSuccess(data: data);
        emit(NotificationInitial());
      }, onFailure: (exception) {
        loading = LoadingException(exception);
        emit(NotificationInitial());
      });
    });
  }
}
