import 'package:flutter/material.dart';

import 'inputDecoration.dart';
class AppTextField extends StatelessWidget {
  final String hint;
  final String label;
  final TextInputType keyboard;

  const AppTextField({
    super.key,
    required this.hint,
    required this.label,
    this.keyboard = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        keyboardType: keyboard,
        decoration: appInputDecoration(
          label: label,
          hint: hint,
        ),
      ),
    );
  }

}