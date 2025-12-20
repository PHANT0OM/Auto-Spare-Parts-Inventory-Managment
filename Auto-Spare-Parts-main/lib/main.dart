import 'package:auto_space/root.dart';
import 'package:auto_space/splash.dart';
import 'package:flutter/material.dart';

import 'features/Order/view/orderView.dart';
import 'features/all_products/view/allProducts_view2.dart';
import 'features/newProduct/view/newProduct.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Auto Spare Parts Store Managment System",
      home: SplashView(),
    );
  }
}
