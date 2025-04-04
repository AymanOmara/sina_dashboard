import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class OrdersHistoryRequest extends IRemoteTarget {
  final int userID;

  OrdersHistoryRequest({
    required this.userID,
  }) {
    path = Urls.myOrders + userID.toString();
  }
}
