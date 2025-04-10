import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/ui/sina_top_navigation_bar.dart';
import 'package:ibn_sina_flutter/features/order/add_order/business_logic/create_order_cubit.dart';
import 'package:ibn_sina_flutter/features/order/add_order/presentation/widgets/cart_widget.dart';
import 'package:ibn_sina_flutter/features/order/add_order/presentation/widgets/government_drop_down.dart';
import 'package:ibn_sina_flutter/features/order/add_order/presentation/widgets/product_drop_down.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateOrderCubit, CreateOrderState>(
      listener: (context, state) {},
      builder: (context, state) {
        CreateOrderCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            children: [
              SinaTopNavigationBar(
                title: "create_order".tr,
              ),
              ProductsDropDown(
                products: cubit.products,
                onSelected: (product) {
                  cubit.addCart(product);
                },
              ),
              GovernorateDropDown(
                onSelected: (value) {
                  cubit.changeGovernorate(value);
                },
              ),
              ListView.builder(
                itemCount: cubit.order.products.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var cart = cubit.order.products[index];
                  return CartWidget(
                    cart: cart,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
