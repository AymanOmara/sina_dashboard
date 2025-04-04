import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimePickerWidget extends StatelessWidget {
  const TimePickerWidget({
    super.key,
    required this.title,
    required this.controller,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.grey,
    this.height = 60,
    this.onChange,
    this.initialDate = "",
    this.required = false,
  });

  final String title;
  final TextEditingController controller;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color borderColor;
  final double height;
  final String? initialDate;
  final void Function(String)? onChange;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          Text(
            "${required ? "* " : ""}$title",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 14),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              suffixIcon: const Padding(
                padding: EdgeInsetsDirectional.only(end: 6),
                child: Icon(Icons.access_time, color: Colors.black),
              ),
              hintText: title,
              border: OutlineInputBorder(),
            ),
            controller: controller..text = initialDate ?? "",
            validator: (txt) => (txt == null || txt.isEmpty) ? "required_field".tr : null,
            readOnly: true,
            onTap: () async {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                initialEntryMode: TimePickerEntryMode.dial,
              ).then((time) {
                if (time != null) {
                  final formattedTime = time.format(context);
                  controller.text = formattedTime;
                  onChange?.call(formattedTime);
                }
              });
            },
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}