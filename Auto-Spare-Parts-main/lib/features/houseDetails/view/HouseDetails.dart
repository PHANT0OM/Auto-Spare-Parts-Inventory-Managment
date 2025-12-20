import 'package:flutter/material.dart';

import 'package:auto_space/core/constants/app_color.dart';
import 'package:auto_space/shared/custom_text.dart';
import 'package:auto_space/features/houseDetails/widget/HouseDetailCard.dart';

class Housedetails extends StatefulWidget {
  const Housedetails({super.key});

  @override
  State<Housedetails> createState() => _HousedetailsState();
}

class _HousedetailsState extends State<Housedetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText(
          text: "Stocked Products",
          color: AppColors.DeepDarkBlue,
          weight: FontWeight.w600,
          size: 28,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProductCard(title: 'Product 1', quantity: 'Quantity: 2'),
            SizedBox(height: 30),
            ProductCard(title: 'Product 2', quantity: 'Quantity: 1'),
          ],
        ),
      ),
    );
  }
}
