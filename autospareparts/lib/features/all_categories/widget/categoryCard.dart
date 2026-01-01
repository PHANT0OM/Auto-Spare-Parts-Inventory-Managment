import 'package:auto_space/features/all_categories/data/category_models.dart';
import 'package:flutter/material.dart';
import 'package:auto_space/core/constants/app_color.dart';
import 'package:auto_space/features/all_categories/view/category_products_view.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModels category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
  elevation: 5,
  
  color: Colors.transparent,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  margin: const EdgeInsets.only(bottom: 20),
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
               Color(0xFFF2F6FA),
  Color(0xFFDCE6F0),
        ],
      ),
    ),
    child: ListTile(
      contentPadding: const EdgeInsets.all(18),

      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: AppColors.SteelBlue.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.category, color: AppColors.SteelBlue),
      ),

      title: Text(
        category.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),

      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CategoryProductsView(category: category),
          ),
        );
      },
    ),
  ),
);

  }
}
