import 'package:domain/features/products/entity/product_entity.dart';
import 'package:ibn_sina_flutter/core/display/i_update_able.dart';

class UpdateProductParams {
  final IUpdateAble<ProductEntity> updateAble;
  ProductEntity? product;

  UpdateProductParams({
    this.product,
    required this.updateAble,
  });
}
