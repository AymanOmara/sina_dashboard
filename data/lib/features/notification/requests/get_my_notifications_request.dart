import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class GetMyNotificationRequest extends IRemoteTarget {
  final int userID;

  GetMyNotificationRequest({
    required this.userID,
  }) {
    path = Urls.notifications + userID.toString();
  }
}
