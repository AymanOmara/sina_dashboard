import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class DeleteAccountRequest extends IRemoteTarget {
  final int userId;

  DeleteAccountRequest({required this.userId}) {
    path = Urls.deleteAccount + userId.toString();
  }

  @override
  HttpMethod get method => HttpMethod.delete;
}
