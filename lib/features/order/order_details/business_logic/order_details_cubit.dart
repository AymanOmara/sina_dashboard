import 'package:bloc/bloc.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:domain/features/products/use_case/fetch_products_use_case.dart';
import 'package:meta/meta.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(
    this.order,
    this._fetchProductsUseCase,
  ) : super(OrderDetailsInitial()) {
    fetchProducts();
  }

  final OrderEntity order;
  final FetchProductsUseCase _fetchProductsUseCase;
  List<ProductEntity> products = [];

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
}
