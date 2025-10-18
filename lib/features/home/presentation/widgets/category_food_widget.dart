import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_test_project/core/theme/app_colors.dart';
import 'package:market_test_project/core/theme/app_fonts.dart';
import 'package:market_test_project/gen/assets.gen.dart';

class CategoryFoodWidget extends StatelessWidget {
  final AssetGenImage assetGenImage;
  final String foodCategory;
  const CategoryFoodWidget({
    super.key,
    required this.assetGenImage,
    required this.foodCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: ColorStyles.gray200),
            shape: BoxShape.circle,
          ),

          padding: EdgeInsets.all(2.w),
          child: assetGenImage.image(width: 63.w, height: 63.w),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          width: 80.w,
          child: Text(
            foodCategory,
            style: TextStyles.labelXS,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
