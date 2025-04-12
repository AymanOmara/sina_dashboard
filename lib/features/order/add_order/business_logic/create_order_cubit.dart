import 'package:bloc/bloc.dart';
import 'package:domain/features/cart/entity/cart_entity.dart';
import 'package:domain/features/order/entity/create_order_entity.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:domain/features/order/use_case/create_order_use_case.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:domain/features/products/use_case/fetch_products_use_case.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/helper/utils.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  CreateOrderCubit(
    this._productsUseCase,
    this._createOrderUseCase,
  ) : super(CreateOrderInitial()) {
    fetchProducts();
  }

  final FetchProductsUseCase _productsUseCase;
  final CreateOrderUseCase _createOrderUseCase;
  List<ProductEntity> products = [];
  OrderEntity? submittedOrder;
  CreateOrderEntity order = CreateOrderEntity();

  void fetchProducts() {
    _productsUseCase().then((value) {
      value.fold(
        onSuccess: (data) {
          products = data;
          emit(CreateOrderInitial());
        },
        onFailure: (exception) {
          emit(CreateOrderInitial());
        },
      );
    });
  }

  void updateOrder(CartEntity cart) {
    if (cart.count <= 0) {
      order.products.remove(cart);
    } else {
      order.products.updateWhere(
        (element) => element.product.productId == cart.product.productId,
        cart,
      );
    }
    emit(CreateOrderInitial());
  }

  void addCart(ProductEntity product) {
    var isExist = order.products.firstWhereOrNull(
      (element) => element.product.productId == product.productId,
    );
    if (isExist == null) {
      order.products.add(CartEntity(product: product));
    } else {
      isExist.count += 1;
      order.products.updateWhere(
        (element) => element.product.productId == product.productId,
        isExist,
      );
    }
    emit(CreateOrderInitial());
  }

  void changeGovernorate(String value) {
    order.governorate = value;
    emit(CreateOrderInitial());
  }

  void submitOrder() {
    order.startTime =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(DateTime.now());
    order.endTime =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(DateTime.now());
    _createOrderUseCase(order).then((value) {
      value.fold(
        onSuccess: (data) {
          submittedOrder = data;
          emit(CreateOrderResult(
            success: data != null,
            message: data != null ? "نجح الطلب" : "حدث خطا",
          ));
        },
        onFailure: (exception) {
          emit(CreateOrderResult(
            success: false,
            message: exception.message.tr,
          ));
        },
      );
    });
  }
}
