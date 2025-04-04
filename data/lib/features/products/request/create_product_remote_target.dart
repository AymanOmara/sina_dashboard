import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';
import 'package:domain/features/products/entity/create_product_request.dart';

class CreateProductRemoteTarget extends IRemoteTarget {
  final CreateProductRequest request;
  final int productId;

  CreateProductRemoteTarget({
    required this.request,
    required this.productId,
  }) {
    if (productId != 0) {
      path = "${Urls.updateProduct}$productId";
      method = HttpMethod.put;
    } else {
      path = Urls.addProduct;
      method = HttpMethod.post;
    }
    body = request.toJson();
  }
}
