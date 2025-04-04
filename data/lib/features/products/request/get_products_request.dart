import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';
import 'package:domain/features/products/entity/fetch_product_request.dart';

class GetProductsRequest extends IRemoteTarget {
  @override
  String get path => Urls.products;

  @override
  HttpMethod get method => HttpMethod.get;
}
