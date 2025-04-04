import 'dart:convert';

import 'package:common/Urls.dart';
import 'package:data/network/remote_target.dart';
import 'package:domain/features/order/entity/create_order_entity.dart';

class CreateOrderRequest extends IRemoteTarget {
  final CreateOrderEntity entity;
  final int userId;

  CreateOrderRequest({
    required this.entity,
    required this.userId,
  }) {
    body = {
      "orderId": 0,
      "userId": userId,
      "orderStatus": "string",
      "orderAcceptTime": "2025-03-16T21:32:51.715Z",
      "orderPrice":  entity.totalPrice,
      "orderLocation": entity.address,
      "orderPhone":entity.phoneNumber,
      "paymentMethod": "string",
      "deliveryFees": 0,
      "orderExcuteTime": "2025-03-16T21:32:51.715Z",
      "orderCompleteTime": "2025-03-16T21:32:51.715Z",
      "userAvilableTime": "string",
      "orderAmount": entity.products.length,
      "orderGovernorate": entity.governorate,
      "orderProducts": entity.products
          .map((e) => {
                "prouductId": e.product.productId,
                "price": e.product.price,
                "amount": e.count
              })
          .toList(),
    };
  }

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String? get path => Urls.createOrder;
}
