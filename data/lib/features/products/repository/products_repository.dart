import 'package:data/common/response_entity_mapper.dart';
import 'package:data/features/products/model/product_model.dart';
import 'package:data/features/products/request/create_product_remote_target.dart';
import 'package:data/features/products/request/delete_product_request.dart';
import 'package:data/features/products/request/get_products_request.dart';
import 'package:data/network/base_response.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/products/entity/create_product_request.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:domain/features/products/repository/i_products_repository.dart';

class ProductsRepository implements IProductsRepository {
  final IAPIService _iApiService;

  const ProductsRepository(this._iApiService);

  @override
  Future<Result<List<ProductEntity>, NetworkException>> fetchProducts() async {
    var result = await _iApiService
        .fetchData<List<ProductModel?>>(GetProductsRequest(), data: Products());
    return result.fold(onSuccess: (data) {
      var list =
          data?.map((e) => e?.toEntity()).whereType<ProductEntity>().toList() ??
              [];
      return Success(list);
    }, onFailure: (e) {
      return Failure(e);
    });
  }

  @override
  Future<Result<Response<bool>?, NetworkException>> deleteProduct(
      int productId) async {
    var result = await _iApiService.fetchData<BaseResponse<bool>>(
        DeleteProductRequest(
          productId: productId,
        ),
        data: BaseResponse());
    return result.fold(
        onSuccess: (data) => Success(data?.toEntity(data.data ?? false)),
        onFailure: (exception) => Failure(exception));
  }

  @override
  Future<Result<ProductEntity?, NetworkException>> updateProduct(
    CreateProductRequest request,
    int productId,
  ) async {
    var result = await _iApiService.fetchData<ProductModel>(
      CreateProductRemoteTarget(
        request: request,
        productId: productId,
      ),
      data: ProductModel(),
    );
    return result.fold(
        onSuccess: (data) => Success(data?.toEntity()),
        onFailure: (exception) => Failure(exception));
  }
}
