import 'package:bloc/bloc.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(
    this.product,
  ) : super(ProductDetailsInitial());
  final ProductEntity product;
}
