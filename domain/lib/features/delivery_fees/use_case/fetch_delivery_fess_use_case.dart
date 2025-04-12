import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/delivery_fees/entity/delivery_fees_entity.dart';
import 'package:domain/features/delivery_fees/repository/i_delivey_fees_repository.dart';

class FetchDeliveryFessUseCase {
  final IDeliveryFeesRepository _repository;
  FetchDeliveryFessUseCase(this._repository);

  Future<Result<DeliveryFeesEntity?, NetworkException>> call() {
    return _repository.fetchDeliveryFees();
  }
}