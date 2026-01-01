import 'package:auto_space/features/all_stock/data/stock_models.dart';
import 'package:flutter/material.dart';
import 'package:auto_space/core/constants/app_color.dart';

class Stockcard extends StatelessWidget {
  final StockModels stock;

  const Stockcard({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return  Card(
  elevation: 4,
  color: Colors.transparent,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  margin: const EdgeInsets.only(bottom: 22),
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFF6F8FA), // رمادي مائل للأزرق
          Color(0xFFE1E7EC),
        ],
      ),
    ),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),

      leading: Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          color: AppColors.SteelBlue.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.warehouse,
          color: AppColors.SteelBlue,
          size: 26,
        ),
      ),

      title: Text(
        stock.productName,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),

      subtitle: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quantity: ${stock.quantity}",
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Warehouse: ${stock.warehouseName}",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),

      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),

      onTap: () {},
    ),
  ),
);

  }
}
