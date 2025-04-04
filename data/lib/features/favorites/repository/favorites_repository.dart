import 'package:common/Urls.dart';
import 'package:data/features/favorites/requests/add_to_favorites_request.dart';
import 'package:data/features/favorites/requests/fetch_favorites_request.dart';
import 'package:data/features/products/model/product_model.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/favorites/repository/i_favorites_repository.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:domain/locale_storage/i_user_local.dart';

class FavoritesRepository implements IFavoritesRepository {
  final IAPIService _service;
  final IUserLocal _userLocal;
  List<ProductEntity> _favorites = [];

  FavoritesRepository(
    this._service,
    this._userLocal,
  );

  @override
  Future<Result<List<ProductEntity>, NetworkException>> fetchFavorites() async {
    if (_favorites.isEmpty) {
      return _getFavorites();
    } else {
      return Success(_favorites);
    }
  }

  Future<Result<List<ProductEntity>, NetworkException>> _getFavorites() async {
    var result = await _service.fetchData(
      FetchFavoritesRequest(userId: _userLocal.getUser()?.userId ?? 0),
      data: Products(),
    );
    return result.fold(onSuccess: (data) {
      var list =
          data?.map((e) => e?.toEntity()).whereType<ProductEntity>().toList() ??
              [];
      _favorites = list;
      return Success(list);
    }, onFailure: (e) {
      return Failure(e);
    });
  }

  @override
  Future<Result<ProductEntity?, NetworkException>> addToFavorites(
    ProductEntity product,
  ) async {
    return _changeFavoriteStatus(
      product: product,
      onRequestSuccess: () {
        _favorites.add(product);
      },
      endPoint: Urls.addToFavorites,
    );
  }

  @override
  Future<Result<ProductEntity?, NetworkException>> removeFromFavorite(
      ProductEntity product) {
    return _changeFavoriteStatus(
      product: product,
      onRequestSuccess: () {
        _favorites
            .removeWhere((element) => element.productId == product.productId);
      },
      endPoint: Urls.removeFromFavorites,
    );
  }

  Future<Result<ProductEntity?, NetworkException>> _changeFavoriteStatus({
    required ProductEntity product,
    required void Function() onRequestSuccess,
    required String endPoint,
  }) async {
    var result = await _service.fetchData<ProductModel>(
      ChangeFavoriteStatusRequest(
        productId: product.productId,
        userId: _userLocal.getUser()?.userId ?? 0,
        endPoint: endPoint,
      ),
      data: ProductModel(),
    );
    return result.fold(onSuccess: (data) {
      if (data != null) {
        onRequestSuccess();
      }
      return Success(data?.toEntity());
    }, onFailure: (e) {
      return Failure(e);
    });
  }
}
