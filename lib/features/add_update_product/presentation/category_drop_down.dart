import 'package:domain/features/products/entity/product_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown({
    super.key,
    this.value,
    this.onChange,
  });

  final String? value;
  final void Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    final options = ProductType.values.map((e) => e.type).toList();
    return DropdownButton<String>(
      hint: Text(
        "category".tr,
      ),
      value: options.firstWhereOrNull(
        (e) => e == value,
      ),
      icon: Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        if (newValue != null) {
          onChange?.call(newValue);
        }
      },
      items: options.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    );
  }
}
//ProductType
