part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsFavoritesResult extends ProductsState {
  final bool isAdd;
  final bool success;
  final String message;

  ProductsFavoritesResult({
    required this.isAdd,
    required this.success,
    required this.message,
  });
}
