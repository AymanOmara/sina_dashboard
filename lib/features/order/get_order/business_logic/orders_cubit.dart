import 'package:bloc/bloc.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:domain/features/order/use_case/fetch_orders_use_case.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this._fetchOrdersUseCase) : super(OrdersInitial()) {
    fetchOrders();
  }

  LoadingState loading = Loading();
  final FetchOrdersUseCase _fetchOrdersUseCase;
  List<OrderEntity> orders = [];

  void fetchOrders() {
    loading = Loading();
    emit(OrdersInitial());
    _fetchOrdersUseCase().then((result) {
      result.fold(
        onSuccess: (data) {
          orders = data;
          loading = LoadingSuccess(data: data);
          emit(OrdersInitial());
        },
        onFailure: (exception) {
          loading = LoadingException(exception);
          emit(OrdersInitial());
        },
      );
    });
  }
}
