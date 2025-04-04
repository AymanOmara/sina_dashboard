import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class RegisterFcmTokenRequest extends IRemoteTarget {
  RegisterFcmTokenRequest({
    required String fcmToken,
    required int userId,
  }) : super(
          body: {
            "fcmToken": fcmToken,
            "userId": userId,
          },
          method: HttpMethod.post,
          path: Urls.registerFcmToken,
        );
}
