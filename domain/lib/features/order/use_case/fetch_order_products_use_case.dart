import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:domain/features/order/repository/i_order_repository.dart';

class FetchOrderProductsUseCase {
  final IOrderRepository _repository;

  FetchOrderProductsUseCase(this._repository);

  Future<Result<List<OrderProductEntity>, NetworkException>> call(
    int orderId,
  ) =>
      _repository.fetchOrderProducts(orderId);
}
