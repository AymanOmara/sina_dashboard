import 'package:common/Urls.dart';
import 'package:data/features/order/model/order_model.dart';
import 'package:data/network/remote_target.dart';
import 'package:domain/features/order/entity/order_entity.dart';

class UpdateOrderRequest extends IRemoteTarget {
  final OrderEntity order;

  UpdateOrderRequest({required this.order}) {
    body = OrderModel.fromOrderEntity(order).toJson();
    method = HttpMethod.put;
    path = Urls.updateOrder + order.orderId.toString();
  }
}
