import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/delivery_fees/entity/delivery_fees_entity.dart';
import 'package:domain/features/delivery_fees/repository/i_delivey_fees_repository.dart';

class UpdateDeliveryFessUseCase {
  final IDeliveryFeesRepository _repository;

  UpdateDeliveryFessUseCase(this._repository);

  Future<Result<DeliveryFeesEntity?, NetworkException>> call(
    DeliveryFeesEntity entity,
  ) {
    return _repository.updateDeliveryFees(entity);
  }
}
