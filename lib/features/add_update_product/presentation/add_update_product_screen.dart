import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/helper/utils.dart';
import 'package:ibn_sina_flutter/core/ui/image_picker_component.dart';
import 'package:ibn_sina_flutter/core/ui/sina_text_field.dart';
import 'package:ibn_sina_flutter/core/ui/sina_top_navigation_bar.dart';
import 'package:ibn_sina_flutter/features/add_update_product/business_logic/add_update_product_cubit.dart';

import 'category_drop_down.dart';

class AddUpdateProductScreen extends StatelessWidget {
  AddUpdateProductScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddUpdateProductCubit, AddUpdateProductState>(
      listener: (context, state) {
        if (state is AddUpdateProductResult) {
          if (state.success) {
            Get.snackbar(
              "success".tr,
              state.message,
              backgroundColor: Colors.green,
            );
          } else {
            Get.snackbar(
              "error".tr,
              state.message,
              backgroundColor: Colors.red,
            );
          }
        }
      },
      builder: (context, state) {
        AddUpdateProductCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            children: [
              SinaTopNavigationBar(title: "products".tr),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField(
                            cubit.product.productName,
                            "product_name",
                            (txt) => cubit.product.productName = txt,
                            Validator.validateRequired),
                        _buildTextField(
                            cubit.product.productDescription,
                            "product_description",
                            (txt) => cubit.product.productDescription = txt,
                            Validator.validateRequired),
                        _buildTextField(cubit.product.madeIn, "made_in",
                            (txt) => cubit.product.madeIn = txt),
                        _buildTextField(
                            cubit.product.price.toString(),
                            "price",
                            (txt) =>
                                cubit.product.price = double.tryParse(txt) ?? 0,
                            Validator.validateRequired),
                        _buildTextField(
                            cubit.product.amount.toString(),
                            "amount",
                            (txt) =>
                                cubit.product.amount = int.tryParse(txt) ?? 0,
                            Validator.validateRequired),
                        _buildTextField(cubit.product.exDate, "expiry_date",
                            (txt) => cubit.product.exDate = txt),
                        _buildTextField(cubit.product.others, "others",
                            (txt) => cubit.product.others = txt),
                        _buildTextField(cubit.product.firstYear, "first_year",
                            (txt) => cubit.product.firstYear = txt),
                        _buildTextField(cubit.product.secondYear, "second_year",
                            (txt) => cubit.product.secondYear = txt),
                        _buildTextField(cubit.product.thirdYear, "third_year",
                            (txt) => cubit.product.thirdYear = txt),
                        _buildTextField(cubit.product.fourthYear, "fourth_year",
                            (txt) => cubit.product.fourthYear = txt),
                        _buildTextField(cubit.product.fifthYear, "fifth_year",
                            (txt) => cubit.product.fifthYear = txt),
                        _buildTextField(cubit.product.type, "type",
                            (txt) => cubit.product.type = txt),
                        CategoryDropDown(
                            value: cubit.product.type,
                            onChange: (txt) {
                              cubit.updateSelectedCategory(txt);
                            }),
                        _buildTextField(
                            cubit.product.discount.toString(),
                            "discount",
                            (txt) => cubit.product.discount =
                                double.tryParse(txt) ?? 0),
                        ImagePickerComponent(
                          imageTitle: "first_photo",
                          oldImageUrl: cubit.product.firstPhoto,
                          onImageSelected: (image) =>
                              cubit.product.firstPhoto = image.base64Image,
                        ),
                        ImagePickerComponent(
                            imageTitle: "second_photo",
                            oldImageUrl: cubit.product.secondPhoto,
                            onImageSelected: (image) =>
                                cubit.product.secondPhoto = image.base64Image),
                        ImagePickerComponent(
                            imageTitle: "third_photo",
                            oldImageUrl: cubit.product.thirdPhoto,
                            onImageSelected: (image) =>
                                cubit.product.thirdPhoto = image.base64Image),
                        ImagePickerComponent(
                            imageTitle: "fourth_photo",
                            oldImageUrl: cubit.product.fourthPhoto,
                            onImageSelected: (image) =>
                                cubit.product.fourthPhoto = image.base64Image),
                        ImagePickerComponent(
                            imageTitle: "fifth_photo",
                            oldImageUrl: cubit.product.fifthPhoto,
                            onImageSelected: (image) =>
                                cubit.product.fifthPhoto = image.base64Image),
                        ImagePickerComponent(
                            imageTitle: "sixth_photo",
                            oldImageUrl: cubit.product.sixthPhoto,
                            onImageSelected: (image) =>
                                cubit.product.sixthPhoto = image.base64Image),
                        _buildTextField(cubit.product.size, "size",
                            (txt) => cubit.product.size = txt),
                        _buildTextField(cubit.product.guarantee, "guarantee",
                            (txt) => cubit.product.guarantee = txt),
                        _buildTextField(
                            cubit.product.rate.toString(),
                            "rate",
                            (txt) =>
                                cubit.product.rate = int.tryParse(txt) ?? 0),
                        _buildTextField(cubit.product.clothes, "clothes",
                            (txt) => cubit.product.clothes = txt),
                        _buildTextField(cubit.product.teeth, "teeth",
                            (txt) => cubit.product.teeth = txt),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                                onPressed: () => Get.back(),
                                child: Text("cancel".tr)),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.submitProduct();
                                }
                              },
                              child: Text("save".tr),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField(
      String? initialValue, String title, Function(String) onChanged,
      [String? Function(String?)? validator]) {
    return Column(
      children: [
        SinaTextField(
          initialValue: initialValue ?? '',
          title: title.tr,
          onChanged: onChanged,
          validator: validator,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
