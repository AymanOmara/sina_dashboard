import 'package:domain/features/products/entity/product_entity.dart';

class CartEntity {
  final ProductEntity product;
  int count = 1;

  CartEntity({
    required this.product,
  });
}
