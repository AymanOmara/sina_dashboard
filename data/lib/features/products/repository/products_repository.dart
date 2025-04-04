import 'package:data/features/products/model/product_model.dart';
import 'package:data/features/products/request/get_products_request.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/products/entity/fetch_product_request.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:domain/features/products/repository/i_products_repository.dart';

class ProductsRepository implements IProductsRepository {
  final IAPIService _iApiService;

  const ProductsRepository(this._iApiService);

  @override
  Future<Result<List<ProductEntity>, NetworkException>> fetchProducts(
    FetchProductsRequest request,
  ) async {
    var result = await _iApiService.fetchData<List<ProductModel?>>(
        GetProductsRequest(request: request),
        data: Products());
    return result.fold(onSuccess: (data) {
      var list =
          data?.map((e) => e?.toEntity()).whereType<ProductEntity>().toList() ??
              [];
      return Success(list);
    }, onFailure: (e) {
      return Failure(e);
    });
  }
}
