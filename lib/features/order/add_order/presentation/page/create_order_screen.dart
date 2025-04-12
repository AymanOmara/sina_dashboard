import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/ui/pdf_generator.dart';
import 'package:ibn_sina_flutter/core/ui/sina_text_field.dart';
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
      listener: (context, state) {
        if (state is CreateOrderResult) {
          if (state.success) {
            Get.snackbar(
              "success".tr,
              state.message,
              backgroundColor: Colors.green,
            );
          } else {
            Get.snackbar(
              "error".tr,
              state.message.tr,
              backgroundColor: Colors.red,
            );
          }
        }
      },
      builder: (context, state) {
        CreateOrderCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            spacing: 12,
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
              SinaTextField(
                title: "address".tr,
                onChanged: (address) {
                  cubit.order.address = address;
                },
              ),
              SinaTextField(
                title: "phone_number".tr,
                onChanged: (phoneNumber) {
                  cubit.order.phoneNumber = phoneNumber;
                },
              ),
              Text(
                "${"order_total".tr}:${""}",
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
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      cubit.submitOrder();
                    },
                    child: Text("تاكيد الطلب"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var order = cubit.submittedOrder;
                      if (order != null) {
                        final pdfGenerator = PDFGenerator();
                        await pdfGenerator.generateOrderDetailsPDF(order);
                        await pdfGenerator.printOrderDetailsPDF(order);
                      }
                    },
                    child: Text(
                      "طباعه الطلب",
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
