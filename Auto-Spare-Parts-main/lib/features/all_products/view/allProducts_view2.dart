import 'package:flutter/material.dart';
import 'package:auto_space/shared/custom_text.dart';
import '../../../core/constants/app_color.dart';
import '../widget/ProductCard2.dart';
import 'package:auto_space/core/network/api_services.dart';
import 'package:auto_space/features/all_products/data/product_models.dart';

class AllproductsView extends StatefulWidget {
  const AllproductsView({super.key});

  @override
  State<AllproductsView> createState() => _AllproductsViewState();
}

class _AllproductsViewState extends State<AllproductsView> {
  final ProductApiService apiServices = ProductApiService();

  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();

    _productsFuture = apiServices.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          text: "Products",
          color: AppColors.DeepDarkBlue,
          weight: FontWeight.w600,
          size: 28,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Error loading products: ${snapshot.error}"),
              ),
            );
          } else if (snapshot.hasData) {
            final products = snapshot.data!;

            if (products.isEmpty) {
              return const Center(child: Text("No products found."));
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductItemCard(product: products[index]);
              },
            );
          }

          return const Center(child: Text("Something went wrong"));
        },
      ),
    );
  }
}
