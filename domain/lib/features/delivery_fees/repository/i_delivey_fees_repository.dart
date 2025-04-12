import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/delivery_fees/entity/delivery_fees_entity.dart';

abstract interface class IDeliveryFeesRepository {
  Future<Result<DeliveryFeesEntity?, NetworkException>> fetchDeliveryFees();

  Future<Result<DeliveryFeesEntity?, NetworkException>> updateDeliveryFees(DeliveryFeesEntity entity);
}
