import 'dart:convert';

import 'package:data/network/decode_able.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:xml/xml.dart';

class OrderModel implements DecodeAble<OrderModel?, Map<String, dynamic>> {
  final int? orderId;
  final int? userId;
  final String? orderTime;
  final String? orderStatus;
  final String? orderAcceptTime;
  final String? orderPrice;
  final String? orderLocation;
  final String? orderPhone;
  final String? paymentMethod;
  final String? deliveryFees;
  final String? orderExecuteTime;
  final String? orderCompleteTime;
  final String? userAvailableTime;
  final int? orderAmount;
  final String? orderGovernorate;
  final List<OrderProductModel>? orderProductList;

  OrderModel({
    this.orderId,
    this.userId,
    this.orderTime,
    this.orderStatus,
    this.orderAcceptTime,
    this.orderPrice,
    this.orderLocation,
    this.orderPhone,
    this.paymentMethod,
    this.deliveryFees,
    this.orderExecuteTime,
    this.orderCompleteTime,
    this.userAvailableTime,
    this.orderAmount,
    this.orderGovernorate,
    this.orderProductList,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json["orderid"],
      userId: json["userid"],
      orderTime: json["ordertime"],
      orderStatus: json["orderstatus"],
      orderAcceptTime: json["orderaccepttime"],
      orderPrice: json["orderprice"],
      orderLocation: json["orderlocation"],
      orderPhone: json["orderphone"],
      paymentMethod: json["paymentmethod"],
      deliveryFees: json["deliveryfees"],
      orderExecuteTime: json["orderexcutetime"],
      orderCompleteTime: json["ordercompletetime"],
      userAvailableTime: json["useravilabletime"],
      orderAmount: json["orderamount"],
      orderGovernorate: json["ordergovernorate"],
      orderProductList: (json["orderProductList"] as List?)
          ?.map((e) => OrderProductModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "orderid": orderId,
      "userid": userId,
      "ordertime": orderTime,
      "orderstatus": orderStatus,
      "orderaccepttime": orderAcceptTime,
      "orderprice": orderPrice,
      "orderlocation": orderLocation,
      "orderphone": orderPhone,
      "paymentmethod": paymentMethod,
      "deliveryfees": deliveryFees,
      "orderexcutetime": orderExecuteTime,
      "ordercompletetime": orderCompleteTime,
      "useravilabletime": userAvailableTime,
      "orderamount": orderAmount,
      "ordergovernorate": orderGovernorate,
      "orderProductList": orderProductList?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  OrderModel? fromJson(Map<String, dynamic> json) {
    return OrderModel.fromJson(json);
  }

  OrderEntity toEntity() {
    return OrderEntity(
      orderId: orderId ?? 0,
      userId: userId ?? 0,
      orderTime: orderTime ?? "",
      orderStatus: orderStatus ?? "",
      orderAcceptTime: orderAcceptTime ?? "",
      orderPrice: double.tryParse(orderPrice ?? "0") ?? 0.0,
      orderLocation: orderLocation ?? "",
      orderPhone: orderPhone ?? "",
      paymentMethod: paymentMethod ?? "",
      deliveryFees: double.tryParse(deliveryFees ?? "0") ?? 0.0,
      orderExecuteTime: orderExecuteTime ?? "",
      orderCompleteTime: orderCompleteTime ?? "",
      userAvailableTime: userAvailableTime ?? "",
      orderAmount: orderAmount ?? 0,
      orderGovernorate: orderGovernorate ?? "",
      orderProductList:
      orderProductList?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}


class OrderProductModel {
  final int? orderId;
  final int? productId;
  final int? amount;
  final double? price;

  OrderProductModel({this.orderId, this.productId, this.amount, this.price});

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      orderId: json["OrderId"],
      productId: json["ProuductId"],
      amount: json["Amount"],
      price: (json["Price"] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "OrderId": orderId,
      "ProuductId": productId,
      "Amount": amount,
      "Price": price,
    };
  }
  OrderProductEntity toEntity() {
    return OrderProductEntity(
      orderId: orderId ?? 0,
      productId: productId ?? 0,
      amount: amount ?? 0,
      price: price ?? 0.0,
    );
  }
}
