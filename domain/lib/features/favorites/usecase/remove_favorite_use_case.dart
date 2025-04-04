import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/favorites/repository/i_favorites_repository.dart';
import 'package:domain/features/products/entity/product_entity.dart';

class RemoveFavoriteUseCase {
  final IFavoritesRepository _repository;

  const RemoveFavoriteUseCase(this._repository);

  Future<Result<ProductEntity?, NetworkException>> call(
    ProductEntity product,
  ) async {
    return await _repository.removeFromFavorite(product);
  }
}
