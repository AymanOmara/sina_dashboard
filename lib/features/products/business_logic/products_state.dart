part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsDeleteResult extends ProductsState {
  final bool success;
  final String message;

  ProductsDeleteResult({
    required this.success,
    required this.message,
  });
}
