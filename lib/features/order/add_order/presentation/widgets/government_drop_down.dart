import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/helper/government_names.dart';

class GovernorateDropDown extends StatelessWidget {
  final Function(String) onSelected;

  const GovernorateDropDown({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'select_governorate'.tr,
        border: OutlineInputBorder(),
      ),
      items: Governorate.values.map((Governorate gov) {
        return DropdownMenuItem<String>(
          value: gov.key.tr,
          child: Text(
            gov.key.tr,
          ),
        );
      }).toList(),
      onChanged: (value) {
        onSelected(value!);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'please_select_governorate'.tr;
        }
        return null;
      },
    );
  }
}
