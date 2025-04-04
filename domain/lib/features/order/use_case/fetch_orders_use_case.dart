import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:domain/features/order/repository/i_order_repository.dart';

class FetchOrdersUseCase {
  final IOrderRepository _orderRepository;
  const FetchOrdersUseCase(this._orderRepository);

  Future<Result<List<OrderEntity>, NetworkException>> call() async {
    return await _orderRepository.fetchOrders();
  }
}