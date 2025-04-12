import 'package:data/features/delivery_fees/model/delivery_fees_model.dart';
import 'package:data/features/delivery_fees/requests/fetch_delivery_fees_request.dart';
import 'package:data/features/delivery_fees/requests/update_delivery_fees_request.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/delivery_fees/entity/delivery_fees_entity.dart';
import 'package:domain/features/delivery_fees/repository/i_delivey_fees_repository.dart';
import 'package:get_it/get_it.dart';

class DeliveryFeesRepository implements IDeliveryFeesRepository {
  final IAPIService _service = GetIt.I<IAPIService>();
  DeliveryFeesEntity? deliveryFees;

  @override
  Future<Result<DeliveryFeesEntity?, NetworkException>>
      fetchDeliveryFees() async {
    if (deliveryFees != null) {
      return Success(deliveryFees);
    }
    var result = await _service.fetchData(
      FetchDeliveryFeesRequest(),
      data: DeliveryFeesModel(),
    );
    return result.fold(onSuccess: (data) {
      deliveryFees = data?.toEntity();
      return Success(data?.toEntity());
    }, onFailure: (e) {
      return Failure(e);
    });
  }

  @override
  Future<Result<DeliveryFeesEntity?, NetworkException>> updateDeliveryFees(
    DeliveryFeesEntity entity,
  ) async {
    var result = await _service.fetchData(
      UpdateDeliveryFeesRequest(
        data: DeliveryFeesModel.fromEntity(entity).toJson(),
      ),
      data: DeliveryFeesModel(),
    );
    return result.fold(onSuccess: (data) {
      deliveryFees = data?.toEntity();
      return Success(data?.toEntity());
    }, onFailure: (e) {
      return Failure(e);
    });
  }
}
