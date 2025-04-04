import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class FetchFavoritesRequest extends IRemoteTarget {
  final int userId;

  FetchFavoritesRequest({required this.userId}) {
    path = Urls.favorites;
    queryParameters = {"userId": userId};
  }
}
