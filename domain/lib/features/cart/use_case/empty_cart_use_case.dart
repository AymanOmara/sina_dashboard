import 'package:domain/features/cart/repository/i_cart_repository.dart';

class EmptyCartUseCase {
  final ICartRepository _cartRepository;

  EmptyCartUseCase(this._cartRepository);

  void call() {
    _cartRepository.clear();
  }
}
