import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.suffix,
    this.keyboardType,
    this.validator,
  });
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
      ),
      validator: validator,
    );
  }
}
