import 'package:domain/features/cart/entity/cart_entity.dart';
import 'package:domain/features/cart/repository/i_cart_repository.dart';
import 'package:domain/features/products/entity/product_entity.dart';

class CartRepository implements ICartRepository {
  List<CartEntity> products = [];

  @override
  List<CartEntity> addToCart(ProductEntity product) {
    final index = products.indexWhere(
      (cartItem) => cartItem.product.productId == product.productId,
    );

    if (index != -1) {
      products[index].count++;
    } else {
      products.add(CartEntity(product: product));
    }
    return products;
  }

  @override
  List<CartEntity> fetchCartList() {
    return products;
  }

  @override
  List<CartEntity> removeCart(ProductEntity product) {
    final index = products.indexWhere(
      (cartItem) => cartItem.product.productId == product.productId,
    );

    if (index != -1) {
      if (products[index].count > 1) {
        products[index].count--;
      } else {
        products.removeAt(index);
      }
    }
    return products;
  }

  @override
  void clear() {
    products.clear();
  }
}
