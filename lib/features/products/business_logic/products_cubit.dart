import 'package:bloc/bloc.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:domain/features/products/use_case/delete_product_use_case.dart';
import 'package:domain/features/products/use_case/fetch_products_use_case.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(
    this._fetchProductsUseCase,
    this._deleteProductUseCase,
  ) : super(ProductsInitial()) {
    fetchProducts();
  }

  List<ProductEntity> favorites = [];
  String searchTerm = "";
  LoadingState loading = Loading();
  final FetchProductsUseCase _fetchProductsUseCase;
  final DeleteProductUseCase _deleteProductUseCase;

  List<ProductEntity> products = [];

  Future<void> fetchProducts() async {
    loading = Loading();
    emit(ProductsLoading());
    final result = await _fetchProductsUseCase();
    result.fold(
      onSuccess: (data) {
        products = data;
        loading = LoadingSuccess(data: data);
        emit(ProductsLoading());
      },
      onFailure: (e) {
        loading = LoadingException(e);
        emit(ProductsLoading());
      },
    );
  }

  void onDelete(ProductEntity product) {
    loading = Loading(showSuccessWidget: true);
    emit(ProductsLoading());
    _deleteProductUseCase(product.productId).then((result) {
      loading = LoadingSuccess(data: true);
      result.fold(onSuccess: (data) {
        products.remove(product);
        emit(ProductsDeleteResult(
            success: data?.data ?? false, message: data?.message ?? ""));
      }, onFailure: (e) {
        emit(ProductsDeleteResult(success: false, message: e.message));
      });
    });
  }

  void onUpdate(ProductEntity product) {}
}
