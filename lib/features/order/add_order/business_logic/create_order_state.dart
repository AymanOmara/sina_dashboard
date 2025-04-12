part of 'create_order_cubit.dart';

@immutable
abstract class CreateOrderState {}

final class CreateOrderInitial extends CreateOrderState {}

final class CreateOrderResult extends CreateOrderState {
  final String message;
  final bool success;

  CreateOrderResult({
    required this.success,
    required this.message,
  });
}
