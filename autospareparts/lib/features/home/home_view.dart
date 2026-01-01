import 'package:auto_space/features/all_stock/view/view_stock.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';
import '../../shared/custom_text.dart';
import '../Order/view/orderView.dart';
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 55,
                  horizontal: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ---------- Header ----------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Monza for Spare Parts",
                              color: AppColors.DeepDarkBlue,
                              weight: FontWeight.w600,
                              size: 19,
                            ),
                            CustomText(
                              text: "أهلاً بك",
                              color: AppColors.DeepDarkBlue,
                              weight: FontWeight.w400,
                              size: 18,
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage("assets/logo.jpg"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // ---------- Image ----------
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/mainImage.png",
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ---------- Text ----------
                    Center(
                      child: const CustomText(
                        text: 'الإدارة أصبحت أسهل',
                        color: Colors.black,
                        weight: FontWeight.bold,
                        size: 28,
                      ),
                    ),
                    Center(
                      child: CustomText(
                        text: 'لكل متاجر قطع الغيار',
                        color: AppColors.DeepDarkBlue,
                        weight: FontWeight.bold,
                        size: 22,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Center(
                      child: CustomText(
                        text: 'إدارة مخزونك بكل سهولة واحترافية',
                        color: AppColors.BlueGray,
                        weight: FontWeight.w500,
                        size: 18,
                      ),
                    ),

                    const SizedBox(height: 50),

                    // ---------- ROW 1 ----------
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
                              MaterialPageRoute(builder: (_) => Newcustomer()),
                            );
                          },
                          child: const CustomText(
                            text: 'إضافة عميل',
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
                          child: const CustomText(
                            text: "إضافة مورد",
                            color: Colors.white,
                            weight: FontWeight.w500,
                            size: 18,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // ---------- ROW 2 ----------
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
                          child: const CustomText(
                            text: 'إضافة طلب',
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
                          child: const CustomText(
                            text: 'إضافة منتج',
                            color: Colors.white,
                            weight: FontWeight.w500,
                            size: 18,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // ---------- ROW 3 ----------
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
                          child: const CustomText(
                            text: 'إضافة مخزون',
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
                          child: const CustomText(
                            text: 'عرض المخزون',
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
      ),
    );
  }
}
