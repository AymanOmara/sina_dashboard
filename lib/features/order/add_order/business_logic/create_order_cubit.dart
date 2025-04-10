import 'package:bloc/bloc.dart';
import 'package:domain/features/cart/entity/cart_entity.dart';
import 'package:domain/features/order/entity/create_order_entity.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:domain/features/products/use_case/fetch_products_use_case.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/helper/utils.dart';
import 'package:meta/meta.dart';

part 'create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  CreateOrderCubit(
    this._productsUseCase,
  ) : super(CreateOrderInitial()) {
    fetchProducts();
  }

  List<ProductEntity> products = [];
  final FetchProductsUseCase _productsUseCase;
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
}
