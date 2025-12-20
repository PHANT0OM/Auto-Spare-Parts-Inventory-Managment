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

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List categories = ['All', 'Electronics', 'Engine', 'Brakes', 'Lights'];
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          /// ================= HEADER + HERO + SEARCH + CATEGORIES =================
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Auto Spare Parts Managment",
                            color: AppColors.DeepDarkBlue,
                            weight: FontWeight.w600,
                            size: 19,
                          ),
                          CustomText(
                            text: "Hello",
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

                  /// Hero
                  ///Image
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
                    text: 'Quality Auto Parts',
                    color: Colors.black,
                    weight: FontWeight.bold,
                    size: 28,
                  ),

                  CustomText(
                    text: 'For Every Vehicle',
                    color: AppColors.DeepDarkBlue,
                    weight: FontWeight.bold,
                    size: 22,
                  ),
                  const SizedBox(height: 14),
                  CustomText(
                    text:
                        'Find genuine spare parts for all car brands. Fast delivery, competitive prices, and expert support.',
                    color: AppColors.BlueGray,
                    weight: FontWeight.w500,
                    size: 15,
                  ),
                  const SizedBox(height: 30),

                  ///Buttons
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
                          text: 'New Customer',
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
                          text: "New Supplier",
                          color: Colors.white,
                          weight: FontWeight.w500,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
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
                          text: 'New Order',
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
                          text: 'New Product',
                          color: Colors.white,
                          weight: FontWeight.w500,
                          size: 18,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// Search
                  TextFormField(
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.black),
                    decoration: appInputDecoration(
                      hint: "Search products...",
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// Categories
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(categories.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 16),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: selectedCategory == index
                                  ? AppColors.DeepDarkBlue
                                  : Colors.black12,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                color: selectedCategory == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// ================= PRODUCTS GRID =================
          // SliverPadding(
          //   padding: const EdgeInsets.all(15),
          //   sliver: ServicesGridWidget()
          // ),
          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: ServicesGridWidget(
              titles: ['المحل', 'مصر الجديدة', 'الشروق'],
            ),
          ),
        ],
      ),
    );
  }
}
