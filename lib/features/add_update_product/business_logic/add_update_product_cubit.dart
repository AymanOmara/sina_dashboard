import 'package:bloc/bloc.dart';
import 'package:domain/features/products/entity/create_product_request.dart';
import 'package:domain/features/products/use_case/update_product_use_case.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:ibn_sina_flutter/features/add_update_product/display/update_product_params.dart';
import 'package:meta/meta.dart';

part 'add_update_product_state.dart';

class AddUpdateProductCubit extends Cubit<AddUpdateProductState> {
  AddUpdateProductCubit(
    this.params,
    this._updateProductUseCase,
  ) : super(AddUpdateProductInitial()) {
    if (params.product != null) {
      product = CreateProductRequest.fromProductEntity(params.product!);
    } else {
      product = CreateProductRequest();
    }
  }

  final UpdateProductParams params;
  late CreateProductRequest product;
  final UpdateProductUseCase _updateProductUseCase;
  LoadingState loadingState = Idle();

  void submitProduct() {
    loadingState = Loading();
    emit(AddUpdateProductInitial());
    _updateProductUseCase
        .call(product, params.product?.productId ?? 0)
        .then((value) {
      loadingState = Idle();
      value.fold(onSuccess: (data) {
        if (data != null) {
          if (params.product == null) {
            params.updateAble.onAdd(data);
          } else {
            params.product = null;
            params.updateAble.onUpdate(data);
          }
        }
        product = CreateProductRequest();
        emit(AddUpdateProductResult(
          success: data != null,
          message: "success".tr,
        ));
      }, onFailure: (e) {
        emit(AddUpdateProductResult(
          success: false,
          message: e.message,
        ));
      });
    });
  }

  void updateSelectedCategory(String? txt) {
    product.type = txt ?? "";
    emit(AddUpdateProductInitial());
  }
}
