import 'package:flutter/material.dart';

class AppFeild extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final BorderSide? borderSide;
  final double? buttonWidth;
  final double? buttonHeight;
  final bool useHeight;
  final TextInputType keyboardType;
  final TextInputAction action;
  final String hintText;
  final Color? fillColor;

  const AppFeild({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.action,
    required this.hintText,
    this.validator,
    this.fillColor,
    this.borderSide,
    this.buttonWidth,
    this.buttonHeight,
    this.useHeight = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: useHeight ? buttonHeight : null,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        textInputAction: action,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? const Color.fromARGB(234, 228, 228, 228),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: borderSide ?? BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: borderSide ?? BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: borderSide ?? BorderSide.none,
          ),
        ),
      ),
    );
  }
}