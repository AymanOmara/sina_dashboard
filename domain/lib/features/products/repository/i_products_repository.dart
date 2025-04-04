import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/products/entity/fetch_product_request.dart';
import 'package:domain/features/products/entity/product_entity.dart';

abstract interface class IProductsRepository {
  Future<Result<List<ProductEntity>,NetworkException>> fetchProducts(FetchProductsRequest request);
}