part of 'add_update_product_cubit.dart';

@immutable
abstract class AddUpdateProductState {}

final class AddUpdateProductInitial extends AddUpdateProductState {}

final class AddUpdateProductResult extends AddUpdateProductState {
  final bool success;
  final String message;

  AddUpdateProductResult({
    required this.success,
    required this.message,
  });
}
