part of 'order_details_cubit.dart';

@immutable
abstract class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}

final class OrderDetailsUpdateResult extends OrderDetailsState {
  final String message;
  final bool success;

  OrderDetailsUpdateResult({
    required this.message,
    required this.success,
  });
}
