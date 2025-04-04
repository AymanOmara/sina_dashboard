class OrderEntity {
  final int orderId;
  final int userId;
  final String orderTime;
  final String orderStatus;
  final String orderAcceptTime;
  final double orderPrice;
  final String orderLocation;
  final String orderPhone;
  final String paymentMethod;
  final double deliveryFees;
  final String orderExecuteTime;
  final String orderCompleteTime;
  final String userAvailableTime;
  final int orderAmount;
  final String orderGovernorate;
  final List<OrderProductEntity> orderProductList;

  OrderEntity({
    required this.orderId,
    required this.userId,
    required this.orderTime,
    required this.orderStatus,
    required this.orderAcceptTime,
    required this.orderPrice,
    required this.orderLocation,
    required this.orderPhone,
    required this.paymentMethod,
    required this.deliveryFees,
    required this.orderExecuteTime,
    required this.orderCompleteTime,
    required this.userAvailableTime,
    required this.orderAmount,
    required this.orderGovernorate,
    required this.orderProductList,
  });
}

class OrderProductEntity {
  final int orderId;
  final int productId;
  final int amount;
  final double price;

  OrderProductEntity({
    required this.orderId,
    required this.productId,
    required this.amount,
    required this.price,
  });
}
