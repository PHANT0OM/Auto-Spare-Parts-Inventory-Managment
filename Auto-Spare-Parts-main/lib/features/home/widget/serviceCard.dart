import 'package:flutter/material.dart';

import '../../../core/constants/app_color.dart';
import '../../../shared/custom_text.dart';
import '../../houseDetails/view/HouseDetails.dart';

class ServicesGridWidget extends StatelessWidget {
  final List<String> titles;

  const ServicesGridWidget({super.key, required this.titles});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.86,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      delegate: SliverChildBuilderDelegate(childCount: titles.length, (
        context,
        index,
      ) {
        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Housedetails()),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 13,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: CustomText(
                text: titles[index],
                color: AppColors.DeepDarkBlue,
                weight: FontWeight.w600,
                size: 19,
              ),
            ),
          ),
        );
      }),
    );
  }
}
