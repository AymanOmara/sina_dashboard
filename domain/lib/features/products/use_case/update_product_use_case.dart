import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/products/entity/create_product_request.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:domain/features/products/repository/i_products_repository.dart';

class UpdateProductUseCase {
  final IProductsRepository _repository;
  const UpdateProductUseCase(this._repository);
  Future<Result<ProductEntity?,NetworkException>> call(CreateProductRequest request,int productId) => _repository.updateProduct(request,productId);
}