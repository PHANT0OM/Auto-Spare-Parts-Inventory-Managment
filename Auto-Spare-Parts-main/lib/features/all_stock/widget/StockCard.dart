import 'package:auto_space/features/all_stock/data/stock_models.dart';
import 'package:flutter/material.dart';
import 'package:auto_space/core/constants/app_color.dart';
import 'package:auto_space/features/all_stock/view/view_stock.dart';

class Stockcard extends StatelessWidget {
  final StockModels stock;

  const Stockcard({super.key, required this.stock});

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
          child: Icon(Icons.warehouse, color: AppColors.SteelBlue),
        ),

        title: Text(
          stock.productName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        subtitle: (Text(
          "Quantity : ${stock.quantity} \n"
          "Warehouse: ${stock.warehouseName}",
        )),
        onTap: () {},
      ),
    );
  }
}
