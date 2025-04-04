import 'package:bloc/bloc.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:domain/features/order/use_case/fetch_orders_use_case.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:meta/meta.dart';

part 'orders_history_state.dart';

class OrdersHistoryCubit extends Cubit<OrdersHistoryState> {
  OrdersHistoryCubit(
    this._fetchOrdersUseCase,
  ) : super(OrdersHistoryInitial()) {
    fetchOrders();
  }
  List<OrderEntity> orders  = [];
  LoadingState loading = Loading();
  final FetchOrdersUseCase _fetchOrdersUseCase;

  void fetchOrders() {
    loading = Loading();
    emit(OrdersHistoryInitial());
    _fetchOrdersUseCase().then((value) {
      value.fold(
        onSuccess: (data) {
          orders = data;
          loading = LoadingSuccess(data: data);
          emit(OrdersHistoryInitial());
        },
        onFailure: (exception) {
          loading = LoadingException(exception);
          emit(OrdersHistoryInitial());
        },
      );
    });
  }
}
