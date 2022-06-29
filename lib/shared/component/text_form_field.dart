import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField(
      {Key? key,
      required this.keyboard,
      this.validator,
      this.hintText,
      required this.controller,
      this.suffixIcon,
      this.obscureText = false,
      this.pressedSuffixIcon})
      : super(key: key);
  final TextInputType keyboard;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final bool obscureText;
  final IconData? suffixIcon;
  final VoidCallback? pressedSuffixIcon;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon:
            IconButton(onPressed: pressedSuffixIcon, icon: Icon(suffixIcon)),
        isDense: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
