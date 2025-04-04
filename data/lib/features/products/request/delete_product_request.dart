import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';

class DeleteProductRequest extends IRemoteTarget {
  final int productId;

  DeleteProductRequest({required this.productId}) {
    path = "${Urls.deleteProduct}$productId";
  }

  @override
  HttpMethod get method => HttpMethod.delete;
}
