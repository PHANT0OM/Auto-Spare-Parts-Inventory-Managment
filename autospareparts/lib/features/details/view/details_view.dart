import 'package:flutter/material.dart';
import 'package:auto_space/features/all_products/data/product_models.dart';
// Assuming you use this
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
        centerTitle: true,
        title: Text(product.name,style: TextStyle(color: Colors.white),), // Show Product Name in App Bar
        backgroundColor: AppColors.SteelBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
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
              _buildDetailRow("بلد المنشأ", product.origin),
              _buildDetailRow("رقم المنتج", "${product.id}"),
              _buildDetailRow("التكلفة", "${product.cost} EGP"),
        
              // If you have descriptions in the future, add them here
              const Spacer(),
        
              
            ],
          ),
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
