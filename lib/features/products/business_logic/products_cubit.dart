import 'package:bloc/bloc.dart';
import 'package:domain/features/favorites/usecase/FetchFavoritesUseCase.dart';
import 'package:domain/features/favorites/usecase/add_to_favorite_use_case.dart';
import 'package:domain/features/favorites/usecase/remove_favorite_use_case.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:domain/features/products/use_case/fetch_products_use_case.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:ibn_sina_flutter/features/products/display/product_list_params.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(
    this.params,
    this._fetchProductsUseCase,
    this._fetchFavoritesUseCase,
    this._addToFavoritesUseCase,
    this._removeFavoriteUseCase,
  ) : super(ProductsInitial()) {
    _initialize();
  }

  List<ProductEntity> favorites = [];
  String searchTerm = "";
  LoadingState loading = Loading();
  final ProductListParams params;
  final FetchProductsUseCase _fetchProductsUseCase;
  final FetchFavoritesUseCase _fetchFavoritesUseCase;
  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  List<ProductEntity> products = [];

  Future<void> _initialize() async {
    fetchFavorites();
  }

  Future<void> fetchProducts() async {
    loading = Loading();
    emit(ProductsLoading());
    final result = await _fetchProductsUseCase(params.request);
    result.fold(
      onSuccess: (data) {
        List<int> favoritesIds = favorites.map((e) => e.productId).toList();
        products = data;
        for (var product in products) {
          product.isFavorite = favoritesIds.contains(product.productId);
        }
        loading = LoadingSuccess(data: data);
        emit(ProductsLoading());
      },
      onFailure: (e) {
        loading = LoadingException(e);
        emit(ProductsLoading());
      },
    );
  }

  void updateSearchTerm(String value) {
    searchTerm = value;
    emit(ProductsInitial());
  }

  Future<void> fetchFavorites() async {
    loading = Loading();
    emit(ProductsLoading());
    final result = await _fetchFavoritesUseCase();
    result.fold(
      onSuccess: (data) {
        favorites = data;
        fetchProducts();
      },
      onFailure: (e) {
        loading = LoadingException(e);
        emit(ProductsLoading());
      },
    );
  }

  void handleFavorite(ProductEntity product) {
    if (product.isFavorite) {
      removeFromFavorite(product);
    } else {
      addToFavorites(product);
    }
  }

  void addToFavorites(ProductEntity product) {
    loading = Loading(showSuccessWidget: true);
    emit(ProductsLoading());
    _addToFavoritesUseCase(product).then((value) {
      loading = LoadingSuccess(data: "");
      value.fold(
        onSuccess: (data) {
          product.isFavorite = true;
          emit(
            ProductsFavoritesResult(
              isAdd: true,
              success: true,
              message: "success_add_favorite".tr,
            ),
          );
        },
        onFailure: (e) {
          emit(
            ProductsFavoritesResult(
              isAdd: true,
              success: false,
              message: e.message.tr,
            ),
          );
        },
      );
    });
  }

  void removeFromFavorite(ProductEntity product) {
    loading = Loading(showSuccessWidget: true);
    emit(ProductsLoading());
    _removeFavoriteUseCase(product).then((value) {
      loading = LoadingSuccess(data: "");
      value.fold(
        onSuccess: (data) {
          product.isFavorite = false;
          emit(
            ProductsFavoritesResult(
              isAdd: true,
              success: true,
              message: "success_delete_favorite".tr,
            ),
          );
        },
        onFailure: (e) {
          emit(
            ProductsFavoritesResult(
              isAdd: true,
              success: false,
              message: e.message.tr,
            ),
          );
        },
      );
    });
  }
}
