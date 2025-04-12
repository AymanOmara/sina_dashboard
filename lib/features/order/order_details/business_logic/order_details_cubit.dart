import 'package:bloc/bloc.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:domain/features/order/use_case/fetch_order_products_use_case.dart';
import 'package:domain/features/order/use_case/update_order_use_case.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:domain/features/products/use_case/fetch_products_use_case.dart';
import 'package:meta/meta.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(
    this.order,
    this._fetchProductsUseCase,
    this._fetchOrderProductsUseCase,
    this._updateOrderUseCase,
  ) : super(OrderDetailsInitial()) {
    fetchOrderProducts();
  }

  final OrderEntity order;
  final FetchProductsUseCase _fetchProductsUseCase;
  final FetchOrderProductsUseCase _fetchOrderProductsUseCase;
  final UpdateOrderUseCase _updateOrderUseCase;
  List<ProductEntity> products = [];
  List<ProductEntity> orderProducts = [];

  void fetchProducts() {
    _fetchProductsUseCase().then((value) {
      value.fold(
        onSuccess: (data) {
          products = data;
          emit(OrderDetailsInitial());
        },
        onFailure: (exception) {},
      );
    });
  }

  void fetchOrderProducts() {
    _fetchOrderProductsUseCase(order.orderId).then((result) {
      result.fold(
        onSuccess: (data) {
          order.orderProductList = data;
          fetchProducts();
        },
        onFailure: (exception) {},
      );
    });
  }

  void updateOrder() {
    order.orderStatus = "Accepted";
    _updateOrderUseCase(order).then((result) {
      result.fold(
        onSuccess: (data) {
          emit(OrderDetailsUpdateResult(
            message: "تم تعديل الطلب بنجاح",
            success: true,
          ));
        },
        onFailure: (exception) {
          emit(OrderDetailsUpdateResult(
            message: exception.message,
            success: false,
          ));
        },
      );
    });
  }
}
