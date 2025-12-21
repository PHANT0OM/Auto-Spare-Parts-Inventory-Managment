import 'package:flutter/material.dart';
import 'package:auto_space/features/all_products/data/product_models.dart';
import 'package:auto_space/shared/custom_text.dart'; // Assuming you use this
import 'package:auto_space/core/constants/app_color.dart'; // Assuming you use this

class Detailsview extends StatelessWidget {
  // 1. Add a field to hold the product data
  final Product product;

  // 2. Require it in the constructor
  const Detailsview({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(product.name), // Show Product Name in App Bar
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/car_placeholder.png", // Use your placeholder
                  fit: BoxFit.cover,
                  errorBuilder: (c, o, s) => const Icon(
                    Icons.directions_car,
                    size: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // PRICE & NAME
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "${product.price} EGP",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.DeepDarkBlue,
              ),
            ),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),

            // DETAILS (Origin, ID, etc.)
            _buildDetailRow("Origin", product.origin),
            _buildDetailRow("Product ID", "${product.id}"),
            _buildDetailRow("Cost", "${product.cost} EGP"),

            // If you have descriptions in the future, add them here
            const Spacer(),

            // ACTION BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Add to cart logic would go here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.SteelBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
