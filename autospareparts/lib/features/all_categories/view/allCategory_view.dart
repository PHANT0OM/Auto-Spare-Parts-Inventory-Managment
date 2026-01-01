import 'package:flutter/material.dart';
import 'package:auto_space/core/constants/app_color.dart';
import 'package:auto_space/shared/custom_text.dart';
import 'package:auto_space/features/all_categories/data/category_models.dart';
import 'package:auto_space/core/network/api_services.dart';
import 'package:auto_space/features/all_categories/data/category_repo.dart';
import 'package:auto_space/features/all_categories/widget/categoryCard.dart';

class AllCategoriesView extends StatefulWidget {
  const AllCategoriesView({super.key});

  @override
  State<AllCategoriesView> createState() => _AllCategoriesViewState();
}

class _AllCategoriesViewState extends State<AllCategoriesView> {
  List<CategoryModels> _allCategories = [];
  List<CategoryModels> _filteredCategories = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  // 2. Fetch Data Function
  Future<void> _fetchCategories() async {
    try {
      final apiService = CategoryApiService();
      final repo = CategoryRepositoryImpl(apiService: apiService);

      final categories = await repo.fetchCategories();

      setState(() {
        _allCategories = categories;
        _filteredCategories = categories; // Initially, display everything
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  // 3. Search Logic
  void _runFilter(String enteredKeyword) {
    List<CategoryModels> results = [];
    if (enteredKeyword.isEmpty) {
      // If the search field is empty, show all categories
      results = _allCategories;
    } else {
      // Filter: Check if name contains the keyword (case insensitive)
      results = _allCategories
          .where(
            (category) => category.name.toLowerCase().contains(
              enteredKeyword.toLowerCase(),
            ),
          )
          .toList();
    }

    // Update the UI
    setState(() {
      _filteredCategories = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          text: "التصنيفات",
          color: AppColors.DeepDarkBlue,
          weight: FontWeight.w600,
          size: 28,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          /// ================= SEARCH BAR =================
          Padding(
  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
  child: TextFormField(
    onChanged: (value) => _runFilter(value), // Call filter on type
    decoration: InputDecoration(
      labelText: 'ابحث عن تصنيف...',
      prefixIcon: Icon(
        Icons.search,
        color: AppColors.SteelBlue,
      ),
      filled: true,
      fillColor:const Color(0xFFF1F5F9),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 20,
      ),
    ),
  ),
),

          /// ================= LIST VIEW =================
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _errorMessage.isNotEmpty
                ? Center(child: Text(_errorMessage))
                : _filteredCategories.isEmpty
                ? const Center(child: Text("No categories found"))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: _filteredCategories.length, // Use filtered list
                    itemBuilder: (context, index) {
                      return CategoryCard(category: _filteredCategories[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
