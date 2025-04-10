import 'package:domain/features/cart/entity/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibn_sina_flutter/features/order/add_order/business_logic/create_order_cubit.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
    required this.cart,
  });

  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
    CreateOrderCubit cubit = context.watch<CreateOrderCubit>();
    return Row(
      children: [
        Text(
          cart.product.productName,
        ),
        Text(
          cart.product.price.toString(),
        ),
        IconButton(
          onPressed: () {
            cart.count += 1;
            cubit.updateOrder(cart);
          },
          icon: Icon(
            Icons.plus_one,
          ),
        ),
        Text(
          cart.count.toString(),
        ),
        IconButton(
          onPressed: () {
            cart.count -= 1;
            cubit.updateOrder(cart);
          },
          icon: Icon(
            Icons.minimize_sharp,
          ),
        )
      ],
    );
  }
}
