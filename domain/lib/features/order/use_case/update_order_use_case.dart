import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:domain/features/order/repository/i_order_repository.dart';

class UpdateOrderUseCase {
  final IOrderRepository _repository;

  const UpdateOrderUseCase(this._repository);

  Future<Result<OrderEntity?, NetworkException>> call(
    OrderEntity order,
  ) =>
      _repository.updateOrder(order);
}
