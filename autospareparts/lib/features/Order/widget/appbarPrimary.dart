import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../shared/custom_text.dart';
class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const PrimaryAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back,color: Colors.white,),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0,
      backgroundColor: AppColors.DeepDarkBlue,
      centerTitle: true,
      title: CustomText(
        text: title,
        color: Colors.white,
        weight: FontWeight.w600,
        size: 22,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}