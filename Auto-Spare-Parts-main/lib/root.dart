import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/constants/app_color.dart';
import 'features/all_categories/view/allCategory_view.dart';
import 'features/all_products/view/allProducts_view2.dart';
import 'features/details/view/details_view.dart';
import 'features/home/home_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  late List<Widget> Screens;
  late PageController controller;
  int currentScreen = 0;

  @override
  void initState() {
    Screens = [HomeView(), AllCategoriesView(), AllproductsView()];
    controller = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: Screens,
        ),

        bottomNavigationBar: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.SteelBlue,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white24,
            currentIndex: currentScreen,
            onTap: (index) {
              setState(() {
                currentScreen = index;
              });
              controller.jumpToPage(currentScreen);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.folder),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.handyman),
                label: "Products",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
