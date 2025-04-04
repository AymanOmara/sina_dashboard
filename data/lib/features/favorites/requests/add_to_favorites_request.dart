import 'package:data/network/remote_target.dart';

class ChangeFavoriteStatusRequest extends IRemoteTarget {
  final int productId;
  final int userId;
  final String endPoint;

  ChangeFavoriteStatusRequest({
    required this.productId,
    required this.userId,
    required this.endPoint,
  }) {
    path = endPoint;
    body = {"userid": userId, "prouductid": productId};
    method = HttpMethod.post;
  }
}
