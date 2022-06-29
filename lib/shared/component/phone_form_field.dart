import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    Key? key,
    required this.controller,
    required this.keyboard,
    this.onSubmitted,
    this.onChanged,
    required this.initialCountry,
    this.hintText,
  }) : super(key: key);
  final TextEditingController controller;
  final TextInputType keyboard;
  final void Function(String)? onSubmitted;
  final ValueChanged<PhoneNumber>? onChanged;
  final String initialCountry;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      keyboardType: keyboard,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
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
      initialCountryCode: initialCountry,
      onChanged: onChanged,
    );
  }
}
