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
      appBar: const PrimaryAppBar(title: 'اضافة طلب جديد'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Customer Details
              const CustomText(
                text: "تفاصيل العميل",
                color: Colors.black,
                weight: FontWeight.w600,
                size: 25,
              ),
              const SizedBox(height: 25),
        
              const AppTextField(
                label: 'اسم العميل',
                hint: 'ادخل اسم العميل',
              ),
        
              const SizedBox(height: 25),
        
              const AppTextField(
                label: 'رقم الهاتف',
                hint: 'ادخل رقم الهاتف',
                keyboard: TextInputType.phone,
              ),
        
              const SizedBox(height: 55),
        
              /// Product Selection
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: 'اختيار المنتج',
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
                    label: const Text('اضافة منتج',style: TextStyle(color: Colors.white),),
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
                    hint: 'ابحث عن منتج...',
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
        
              const SizedBox(height: 25),
        
              ProductItem(
                title: 'تيل فرامل أمامي',
                sku: 'SKU: BRK-001',
                price: 178,
                quantity: brakeQty,
                onAdd: () => setState(() => brakeQty++),
                onRemove: () {
                  if (brakeQty > 1) setState(() => brakeQty--);
                },
              ),
        
              ProductItem(
                title: 'فلتر هواء محرك',
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
      ),
    );
  }
}


