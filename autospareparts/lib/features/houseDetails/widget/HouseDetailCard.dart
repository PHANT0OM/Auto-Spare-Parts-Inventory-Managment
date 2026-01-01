import 'package:flutter/material.dart';

import 'package:auto_space/core/constants/app_color.dart';
import 'package:auto_space/shared/custom_text.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String quantity;

  const ProductCard({super.key, required this.title, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              color: AppColors.DeepDarkBlue,
              weight: FontWeight.w600,
              size: 20,
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.grey.shade200),
            const SizedBox(height: 6),

            CustomText(
              text: quantity,
              color: AppColors.DeepDarkBlue.withOpacity(0.7),
              weight: FontWeight.w600,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
