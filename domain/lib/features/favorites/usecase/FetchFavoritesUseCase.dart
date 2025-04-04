import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/favorites/repository/i_favorites_repository.dart';
import 'package:domain/features/products/entity/product_entity.dart';

class FetchFavoritesUseCase {
  final IFavoritesRepository _repository;

  const FetchFavoritesUseCase(this._repository);

  Future<Result<List<ProductEntity>, NetworkException>> call() async {
    return await _repository.fetchFavorites();
  }
}
