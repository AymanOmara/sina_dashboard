import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:domain/features/order/entity/order_entity.dart';

class OrderHistoryWidget extends StatelessWidget {
  const OrderHistoryWidget({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order ID & Status Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${'order_id'.tr}: #${order.orderId}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Chip(
                  label: Text(order.orderStatus.tr), // Localized status
                  backgroundColor: _getStatusColor(order.orderStatus),
                ),
              ],
            ),
            const SizedBox(height: 8),

            Text(
                "${'total_price'.tr}: \$${order.orderPrice}",
                style: const TextStyle(fontSize: 14)),
            Text("${'payment_method'.tr}: ${order.paymentMethod.tr}",
                style: const TextStyle(fontSize: 14)),
            Text("${'order_time'.tr}: ${order.orderTime}",
                style: const TextStyle(fontSize: 14)),

            const Divider(height: 16, thickness: 1),

            // Ordered Products
            Text('products'.tr,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Column(
              children: order.orderProductList.map((product) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Product ${product.productId}"),
                  // Replace with real product name if available
                  subtitle: Text("${'amount'.tr}: ${product.amount}"),
                  trailing: Text("\$${product.price.toStringAsFixed(2)}"),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }
}
