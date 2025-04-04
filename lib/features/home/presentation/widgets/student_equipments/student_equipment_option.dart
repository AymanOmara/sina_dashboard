import 'package:flutter/material.dart';

class StudentEquipmentOption extends StatelessWidget {
  const StudentEquipmentOption({
    super.key,
    required this.onChange,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final void Function(bool) onChange;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Spacer(),
        Switch(
          value: isSelected,
          onChanged: onChange,
        )
      ],
    );
  }
}
