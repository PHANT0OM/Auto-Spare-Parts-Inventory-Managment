import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart'; // Adjust path if needed

// 1. Add <T> here so it works for String or int
class CustomDropdownField<T> extends StatelessWidget {
  final String labelText;
  // 2. The value is now type T (dynamic)
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;

  const CustomDropdownField({
    super.key,
    required this.labelText,
    required this.items,
    required this.onChanged,
    // 3. Add value to constructor
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      // 4. Pass the value here. This determines which item is selected.
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.SteelBlue, width: 2),
        ),
      ),
    );
  }
}
