import 'package:auto_space/features/all_categories/data/category_models.dart';
import 'package:flutter/material.dart';
import 'package:auto_space/core/constants/app_color.dart';
import 'package:auto_space/features/all_categories/data/category_models.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModels category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),

        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.SteelBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.category, color: AppColors.SteelBlue),
        ),

        title: Text(
          category.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        subtitle: Text(
          "ID: ${category.id}",
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: () {
          print("Tapped on ${category.name}");
        },
      ),
    );
  }
}
