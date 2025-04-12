part of 'delivery_cubit.dart';

@immutable
abstract class DeliveryState {}

final class DeliveryInitial extends DeliveryState {}

final class DeliveryGetResult extends DeliveryState {
  final DeliveryFeesEntity entity;

  DeliveryGetResult({
    required this.entity,
  });
}

final class DeliveryUpdateResult extends DeliveryState {
  final String message;
  final bool success;

  DeliveryUpdateResult({
    required this.message,
    required this.success,
  });
}
