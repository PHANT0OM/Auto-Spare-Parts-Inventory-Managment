import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../shared/custom_text.dart';
import '../../details/view/details_view.dart';

import 'package:auto_space/features/all_products/data/product_models.dart';

class ProductItemCard extends StatelessWidget {
  final Product product;

  const ProductItemCard({super.key, required this.product});

  String get _imagePath => "assets/images/car_placeholder.png";
  double get _rating => 4.5;

  Widget _buildRatingStars(double rating) {
    final int fullStars = rating.floor();
    final bool hasHalfStar = rating - fullStars >= 0.5;

    return Row(
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return const Icon(Icons.star, color: Colors.amber, size: 18);
        } else if (index == fullStars && hasHalfStar) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 18);
        } else {
          return const Icon(Icons.star_border, color: Colors.grey, size: 18);
        }
      }),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = AppColors.DeepDarkBlue;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 1. IMAGE SECTION
          Container(
            height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(14),
              ),
              child: Image.asset(
                _imagePath,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(
                    Icons.directions_car,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

                Row(
                  children: [
                    _buildRatingStars(_rating),
                    const SizedBox(width: 6),
                    Text(
                      '(${_rating.toStringAsFixed(1)})',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Detailsview(product: product),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.SteelBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: const CustomText(
                        text: 'View Details',
                        color: Colors.white,
                        weight: FontWeight.w600,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
