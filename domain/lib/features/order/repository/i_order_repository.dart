import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/create_order_entity.dart';
import 'package:domain/features/order/entity/order_entity.dart';

abstract interface class IOrderRepository {
  Future<Result<OrderEntity?, NetworkException>> createOrder(CreateOrderEntity order);
  Future<Result<List<OrderEntity>, NetworkException>> fetchOrders();
}
