import 'package:domain/features/cart/entity/cart_entity.dart';
import 'package:domain/features/cart/repository/i_cart_repository.dart';

class GetCartProductUseCase {
  final ICartRepository _cartRepository;

  const GetCartProductUseCase(this._cartRepository);

  List<CartEntity> call() {
    return _cartRepository.fetchCartList();
  }
}
