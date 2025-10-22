import 'package:flutter/material.dart';
import 'package:market_test_project/core/theme/app_colors.dart';
import 'package:market_test_project/core/theme/app_fonts.dart';
import 'package:market_test_project/core/widgets/app_circle_button.dart';
import 'package:market_test_project/gen/assets.gen.dart';

class ProductsTitle extends StatelessWidget {
  const ProductsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          AppCircleButton(
            icon: Assets.icons.fire,
            padding: 5,
            buttonSize: 24,
            radius: 8,
            backgroundColor: ColorStyles.crimson400,
          ),
          const SizedBox(width: 10),
          Text(
            'Хит продаж',
            style: TextStyles.titleh4.copyWith(color: ColorStyles.gray700),
          ),
        ],
      ),
    );
  }
}
