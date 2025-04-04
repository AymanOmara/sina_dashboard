import 'package:domain/features/products/entity/fetch_product_request.dart';
import 'package:ibn_sina_flutter/features/home/display/home_category_display.dart';

class ProductListParams {
  final FetchProductsRequest request;
  final HomeCategoryDisplay display;

  ProductListParams({required this.request, required this.display});
}
