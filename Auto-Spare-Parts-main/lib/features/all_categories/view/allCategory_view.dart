import 'package:auto_space/core/network/api_services.dart';
import 'package:auto_space/features/all_categories/data/category_models.dart';
import 'package:auto_space/features/all_categories/data/category_repo.dart';
import 'package:auto_space/features/all_categories/widget/categoryCard.dart';
import 'package:flutter/material.dart';
import 'package:auto_space/shared/custom_text.dart';
import 'package:auto_space/core/constants/app_color.dart';
// Import your Data Layer
import 'package:auto_space/features/all_categories/data/category_models.dart';
import 'package:auto_space/core/network/api_services.dart';
import 'package:auto_space/features/all_categories/data/category_repo.dart';
// Import your Widget
import 'package:auto_space/features/all_categories/widget/categoryCard.dart';

class AllCategoriesView extends StatefulWidget {
  const AllCategoriesView({super.key});

  @override
  State<AllCategoriesView> createState() => _AllCategoriesViewState();
}

class _AllCategoriesViewState extends State<AllCategoriesView> {
  // 1. Initialize Repo
  late CategoryRepository categoryRepo;
  late Future<List<CategoryModels>> _categoriesFuture;

  @override
  void initState() {
    super.initState();
    // Initialize Service & Repo
    final apiService = CategoryApiService();
    categoryRepo = CategoryRepositoryImpl(apiService: apiService);

    // Start fetching
    _categoriesFuture = categoryRepo.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          text: "Categories",
          color: AppColors.DeepDarkBlue,
          weight: FontWeight.w600,
          size: 28,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<List<CategoryModels>>(
        future: _categoriesFuture,
        builder: (context, snapshot) {
          // A. Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // B. Error
          else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          // C. Success
          else if (snapshot.hasData) {
            final categories = snapshot.data!;

            if (categories.isEmpty) {
              return const Center(child: Text("No categories found."));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryCard(category: categories[index]);
              },
            );
          }
          return const Center(child: Text("Something went wrong"));
        },
      ),
    );
  }
}
