import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/helper/utils.dart';

class SinaTextField extends StatelessWidget {
  const SinaTextField({
    super.key,
    required this.title,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.obscureText = false,
    required this.onChanged,
    this.controller,
    this.suffixIcon,
    this.required = false,
    this.placeholder = "",
    this.readOnly = false,
    this.prefix,
    this.onTap,
    this.initialValue,
    this.fillColor,
    this.placeHolderStyle,
  });

  final String title;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool required;
  final String placeholder;
  final bool readOnly;
  final Widget? prefix;
  final void Function()? onTap;
  final String? initialValue;
  final Color? fillColor;
  final TextStyle? placeHolderStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${required ? "* " : ""}$title",
        ),
        const SizedBox(height: 12),
        TextFormField(
          onTap: onTap,
          keyboardType: keyboardType,
          initialValue: controller == null ? initialValue : null,
          controller: controller?..text = initialValue ?? '',
          readOnly: readOnly,
          obscureText: obscureText,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: suffixIcon ?? const SizedBox(),
            prefixIcon: prefix,
            hintText: placeholder,
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.orange, // Orange border outline
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.orange, // Orange border outline
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.orange, // Orange border outline
                width: 2.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  factory SinaTextField.password({
    String title = 'password',
    required bool obscureText,
    required void Function() onPress,
    required void Function(String) onChange,
    required String? Function(String?) validator,
  }) {
    return SinaTextField(
      title: title.tr,
      onChanged: (password) {
        onChange(password);
      },
      obscureText: obscureText,
      suffixIcon: InkWell(
        onTap: () => onPress(),
        child: SizedBox(
          child: Icon(
            Icons.remove_red_eye,
          ),
        ),
      ),
      validator: (password) => validator(password),
    );
  }

  factory SinaTextField.confirmPassword({
    required bool obscureText,
    required void Function() onPress,
    required void Function(String) onChange,
    required String password,
  }) {
    return SinaTextField(
      title: 'confirmPassword'.tr,
      onChanged: (password) {
        onChange(password);
      },
      obscureText: obscureText,
      suffixIcon: InkWell(
        onTap: () => onPress(),
        child: SizedBox(
          child: Icon(
            Icons.remove_red_eye,
          ),
        ),
      ),
      validator: (confirmPassword) =>
          Validator.validateConfirmPassword(confirmPassword, password),
    );
  }
}
