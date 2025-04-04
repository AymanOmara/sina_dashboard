import 'package:domain/features/cart/entity/cart_entity.dart';

class CreateOrderEntity {
  String address = "";
  String startTime = "";
  String endTime = "";
  String phoneNumber = "";
  String paymentMethod = "";
  String governorate = "";
  double totalPrice = 0;
  double shippingCost = 0;
  List<CartEntity> products = [];
}
