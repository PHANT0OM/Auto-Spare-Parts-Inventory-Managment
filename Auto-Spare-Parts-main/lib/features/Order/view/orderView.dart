import 'package:auto_space/core/constants/app_color.dart';
import 'package:auto_space/shared/custom_text.dart';
import 'package:flutter/material.dart';

import '../../newProduct/view/newProduct.dart';
import '../widget/EmptyHint.dart';
import '../widget/appbarPrimary.dart';
import '../widget/inputDecoration.dart';
import '../widget/productItems.dart';
import '../widget/textfield.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  int brakeQty = 2;
  int filterQty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PrimaryAppBar(title: 'Create New Order'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Customer Details
            const CustomText(
              text: "Customer Details",
              color: Colors.black,
              weight: FontWeight.w600,
              size: 25,
            ),
            const SizedBox(height: 25),

            const AppTextField(
              label: 'Customer name',
              hint: 'Enter Customer name',
            ),

            const SizedBox(height: 25),

            const AppTextField(
              label: 'Phone number',
              hint: 'Enter Phone number',
              keyboard: TextInputType.phone,
            ),

            const SizedBox(height: 55),

            /// Product Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: 'Product Selection',
                  color: Colors.black,
                  weight: FontWeight.w600,
                  size: 25,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.SteelBlue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NewproductView(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add,size: 20,color: Colors.white,),
                  label: const Text('Add Product',style: TextStyle(color: Colors.white),),
                )
              ],
            ),

            const SizedBox(height: 25),

            /// Search Field (Inline – no widget)
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: TextFormField(
                decoration: appInputDecoration(
                  hint: 'Search products by name...',
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),

            const SizedBox(height: 25),

            ProductItem(
              title: 'Premium Brake Disc',
              sku: 'SKU: BRK-001',
              price: 178,
              quantity: brakeQty,
              onAdd: () => setState(() => brakeQty++),
              onRemove: () {
                if (brakeQty > 1) setState(() => brakeQty--);
              },
            ),

            ProductItem(
              title: 'High Flow Oil Filter',
              sku: 'SKU: FLT-005',
              price: 24,
              quantity: filterQty,
              onAdd: () => setState(() => filterQty++),
              onRemove: () {
                if (filterQty > 1) setState(() => filterQty--);
              },
            ),

            const SizedBox(height: 28),
            const EmptyHint(),
          ],
        ),
      ),
    );
  }
}


