import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/products/entity/product_entity.dart';

abstract interface class IFavoritesRepository {
  Future<Result<List<ProductEntity>, NetworkException>> fetchFavorites();
  Future<Result<ProductEntity?, NetworkException>> addToFavorites(ProductEntity product);
  Future<Result<ProductEntity?, NetworkException>> removeFromFavorite(ProductEntity product);
}