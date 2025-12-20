import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';

InputDecoration appInputDecoration({
  String? label,
  required String hint,
  Widget? prefixIcon,
}) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: Colors.grey),
    hintText: hint,
    hintStyle: const TextStyle(color: Colors.grey),
    prefixIcon: prefixIcon,
    filled: true,
    fillColor: const Color(0xFFF9FAFB),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        color: AppColors.DeepDarkBlue,
        width: 1.2,
      ),
    ),
  );
}
