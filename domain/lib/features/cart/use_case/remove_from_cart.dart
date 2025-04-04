import 'package:domain/features/cart/entity/cart_entity.dart';
import 'package:domain/features/cart/repository/i_cart_repository.dart';
import 'package:domain/features/products/entity/product_entity.dart';

class RemoveCartProductUseCase {
  final ICartRepository _cartRepository;

  const RemoveCartProductUseCase(this._cartRepository);

  List<CartEntity> call(ProductEntity product) {
    return _cartRepository.removeCart(product);
  }
}
