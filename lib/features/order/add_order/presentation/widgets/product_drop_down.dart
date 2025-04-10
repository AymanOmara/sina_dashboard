import 'package:domain/features/products/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsDropDown extends StatelessWidget {
  const ProductsDropDown({
    super.key,
    required this.products,
    required this.onSelected,
  });

  final List<ProductEntity> products;
  final void Function(ProductEntity) onSelected;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ProductEntity>(
      decoration: InputDecoration(
        labelText: 'select_product'.tr,
        border: OutlineInputBorder(),
      ),
      items: products.map((ProductEntity pr) {
        return DropdownMenuItem<ProductEntity>(
          value: pr,
          child: Text(
            pr.productName,
          ),
        );
      }).toList(),
      onChanged: (value) {
        onSelected(value!);
      },
      validator: (value) {
        if (value == null) {
          return 'please_select_product'.tr;
        }
        return null;
      },
    );
  }
}
