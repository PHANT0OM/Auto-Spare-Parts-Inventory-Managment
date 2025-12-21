import 'package:flutter/material.dart';
import 'package:auto_space/core/constants/app_color.dart';
import 'package:auto_space/shared/custom_text.dart';
import 'package:auto_space/features/all_categories/data/category_models.dart';
// Import your Product Models and API Service
import 'package:auto_space/features/all_products/data/product_models.dart';
import 'package:auto_space/core/network/api_services.dart';

class CategoryProductsView extends StatefulWidget {
  final CategoryModels category;

  const CategoryProductsView({super.key, required this.category});

  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = _loadCategoryProducts();
  }

  // Fetch all products and filter locally by Category ID
  Future<List<Product>> _loadCategoryProducts() async {
    final api = ProductApiService();
    // Assuming you have a getProducts method. If not, see Step 3 below.
    final allProducts = await api.getProducts();

    // Filter: Keep only products where category_id matches the selected category
    return allProducts
        .where((p) => p.categoryId == widget.category.id)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.SteelBlue,
        title: CustomText(
          text: widget.category.name, // Show Category Name
          color: Colors.white,
          weight: FontWeight.w600,
          size: 22,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No products found in this category."),
            );
          }

          final products = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.SteelBlue.withOpacity(0.1),
                    child: const Icon(
                      Icons.garage_rounded,
                      color: Color(0xff1B3C53),
                    ),
                  ),
                  title: Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Cost: ${product.cost} EGP \n"
                    "Price: ${product.price} EGP \n"
                    "Origin: ${product.origin}",
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
