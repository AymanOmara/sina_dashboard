import 'package:domain/features/cart/entity/cart_entity.dart';
import 'package:domain/features/products/entity/product_entity.dart';

abstract interface class ICartRepository {
  List<CartEntity> fetchCartList();

  List<CartEntity> addToCart(ProductEntity product);

  List<CartEntity> removeCart(ProductEntity product);

  void clear();
}
