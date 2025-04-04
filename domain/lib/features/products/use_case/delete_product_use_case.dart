import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/products/repository/i_products_repository.dart';

class DeleteProductUseCase {
  final IProductsRepository _repository;

  const DeleteProductUseCase(this._repository);

  Future<Result<Response<bool>?, NetworkException>> call(int productId) async {
    return _repository.deleteProduct(productId);
  }
}
