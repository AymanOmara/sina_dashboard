import 'package:bloc/bloc.dart';
import 'package:domain/features/delivery_fees/entity/delivery_fees_entity.dart';
import 'package:domain/features/delivery_fees/use_case/fetch_delivery_fess_use_case.dart';
import 'package:domain/features/delivery_fees/use_case/update_delivery_fess_use_case.dart';
import 'package:meta/meta.dart';

part 'delivery_state.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  DeliveryCubit(
    this._deliveryFessUseCase,
    this._updateDeliveryFessUseCase,
  ) : super(DeliveryInitial()) {
    fetchDeliveryFees();
  }

  final FetchDeliveryFessUseCase _deliveryFessUseCase;
  final UpdateDeliveryFessUseCase _updateDeliveryFessUseCase;
  DeliveryFeesEntity? deliveryFees;

  void fetchDeliveryFees() {
    _deliveryFessUseCase().then((value) {
      value.fold(onSuccess: (data) {
        deliveryFees = data;
        emit(DeliveryGetResult(entity: deliveryFees!));
      }, onFailure: (e) {
        emit(DeliveryInitial());
      });
    });
  }

  void updateDeliveryFees() {
    DeliveryFeesEntity entity = deliveryFees ??
        DeliveryFeesEntity(
          inCairo: 70,
          outCairo: 70,
        );
    _updateDeliveryFessUseCase(entity).then((value) {
      value.fold(onSuccess: (data) {
        deliveryFees = data;
        emit(DeliveryUpdateResult(
          message: 'success',
          success: true,
        ));
      }, onFailure: (e) {
        emit(DeliveryUpdateResult(
          message: e.message,
          success: false,
        ));
      });
    });
  }
}
