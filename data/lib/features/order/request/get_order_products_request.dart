import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class GetOrderProductRequest extends IRemoteTarget {
  final int orderId;

  GetOrderProductRequest({
    required this.orderId,
  }) {
    path = Urls.getOrderProducts + orderId.toString();
  }
}
