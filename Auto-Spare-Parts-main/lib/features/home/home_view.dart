import 'package:auto_space/features/all_stock/view/view_stock.dart';
import 'package:auto_space/features/home/widget/serviceCard.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';
import '../../shared/custom_text.dart';
import '../Order/view/orderView.dart';
import '../Order/widget/inputDecoration.dart';
import '../all_categories/view/allCategory_view.dart';
import '../houseDetails/view/HouseDetails.dart';
import '../newCustomer/view/newCustomer.dart' hide Newsupplier;
import '../newProduct/view/newProduct.dart';
import '../newSupplier/view/NewSupplier.dart';
import 'package:auto_space/features/newCustomer/view/newCustomer.dart';
import 'package:auto_space/features/new_stock/view/manage_stock.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Monza Managment System",
                            color: AppColors.DeepDarkBlue,
                            weight: FontWeight.w600,
                            size: 19,
                          ),
                          CustomText(
                            text: "Hello..",
                            color: AppColors.DeepDarkBlue,
                            weight: FontWeight.w400,
                            size: 18,
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage("assets/logo.jpg"),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/mainImage.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 30),

                  ///Text
                  CustomText(
                    text: 'Managment Made Easier',
                    color: Colors.black,
                    weight: FontWeight.bold,
                    size: 28,
                  ),
                  CustomText(
                    text: 'For Every Spare Parts Store',
                    color: AppColors.DeepDarkBlue,
                    weight: FontWeight.bold,
                    size: 22,
                  ),
                  const SizedBox(height: 14),
                  CustomText(
                    text: 'Manage your inventory with seamless ease',
                    color: AppColors.BlueGray,
                    weight: FontWeight.w500,
                    size: 18,
                  ),
                  const SizedBox(height: 30),

                  // --- ROW 1: Customer & Supplier ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.SteelBlue,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Newcustomer(),
                            ),
                          );
                        },
                        child: CustomText(
                          text: 'Add Customer',
                          color: Colors.white,
                          weight: FontWeight.w500,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.SteelBlue,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Newsupplier()),
                          );
                        },
                        child: CustomText(
                          text: "Add Supplier",
                          color: Colors.white,
                          weight: FontWeight.w500,
                          size: 18,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // --- ROW 2: Order & Product (Stock removed) ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.SteelBlue,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CreateOrderPage(),
                            ),
                          );
                        },
                        child: CustomText(
                          text: 'Add Order',
                          color: Colors.white,
                          weight: FontWeight.w500,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.SteelBlue,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const NewproductView(),
                            ),
                          );
                        },
                        child: CustomText(
                          text: 'Add Product',
                          color: Colors.white,
                          weight: FontWeight.w500,
                          size: 18,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // --- ROW 3: Manage Stock (Centered) ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.SteelBlue,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const Managestockview(),
                            ),
                          );
                        },
                        child: CustomText(
                          text: 'Add Stock',
                          color: Colors.white,
                          weight: FontWeight.w500,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.SteelBlue,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AllStockView(),
                            ),
                          );
                        },
                        child: CustomText(
                          text: 'View Stock',
                          color: Colors.white,
                          weight: FontWeight.w500,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
