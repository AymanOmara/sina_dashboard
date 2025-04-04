import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/products/entity/create_product_request.dart';
import 'package:domain/features/products/entity/fetch_product_request.dart';
import 'package:domain/features/products/entity/product_entity.dart';

abstract interface class IProductsRepository {
  Future<Result<List<ProductEntity>,NetworkException>> fetchProducts();
  Future<Result<ProductEntity?,NetworkException>> updateProduct(CreateProductRequest request,int productId);
  Future<Result<Response<bool>?,NetworkException>> deleteProduct(int productId);
}