import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/ui/pdf_generator.dart';
import 'package:ibn_sina_flutter/core/ui/sina_top_navigation_bar.dart';
import 'package:ibn_sina_flutter/features/order/order_details/business_logic/order_details_cubit.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
      listener: (context, state) {
        if (state is OrderDetailsUpdateResult) {
          if (state.success) {
            Get.snackbar(
              "success".tr,
              state.message,
              backgroundColor: Colors.green,
            );
          } else {
            Get.snackbar(
              "error".tr,
              state.message,
              backgroundColor: Colors.red,
            );
          }
        }
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<OrderDetailsCubit>(context);
        final order = cubit.order;
        return Scaffold(
          body: Column(
            children: [
              SinaTopNavigationBar(title: "order_details".tr),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildInfoRow("order_date".tr, order.orderTime),
                    _buildInfoRow("accepted_date".tr, order.orderAcceptTime),
                    _buildInfoRow("order_status".tr, order.orderStatus),
                    _buildInfoRow("client_id".tr, order.userId),
                    _buildInfoRow("governorate".tr, order.orderGovernorate),
                    _buildInfoRow("user_phone".tr, order.orderPhone),
                    _buildInfoRow("order_price".tr, order.orderPrice),
                    _buildInfoRow("client_name".tr, order.useName),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            cubit.updateOrder();
                          },
                          child: Text("update_order_status".tr),
                        ),
                        ElevatedButton(
                          onPressed: ()async {
                            var pdf =  PDFGenerator();
                            await pdf.generateOrderDetailsPDF(cubit.order);
                            await pdf.printOrderDetailsPDF(cubit.order);
                          },
                          child: Text(
                            "print_order".tr,
                          ),
                        )
                      ],
                    ),
                    _buildOrderItems(cubit),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              value?.toString() ?? '',
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItems(OrderDetailsCubit cubit) {
    for (var item in cubit.order.orderProductList) {
      final product = cubit.products.firstWhereOrNull(
        (element) => element.productId == item.productId,
      );
      item.productName = product?.productName ?? "";
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cubit.order.orderProductList.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final item = cubit.order.orderProductList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 16),
                Text(
                  "${"product_name".tr} ${item.productName}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("${"price".tr}: ${item.price}"),
                const SizedBox(width: 16),
                Text("${"quantity".tr}: ${item.amount}"),
              ],
            ),
          ],
        );
      },
    );
  }
}
