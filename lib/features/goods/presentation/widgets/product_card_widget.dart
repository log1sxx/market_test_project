import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_test_project/core/theme/app_fonts.dart';
import 'package:market_test_project/core/widgets/app_circle_button.dart';
import 'package:market_test_project/core/widgets/app_image_network.dart';
import 'package:market_test_project/features/goods/domain/entities/product_entity.dart';
import 'package:market_test_project/gen/assets.gen.dart';

class ProductCardWidget extends StatefulWidget {
  final ProductEntity product;
  const ProductCardWidget({super.key, required this.product});

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 114.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImageNetwork(imageUrl: widget.product.imageLink, borderRadius: 12),
          SizedBox(height: 5.h),
          Text(widget.product.productName, style: TextStyles.labelXS),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${widget.product.price.toInt()}',
                    style: TextStyles.labelS,
                  ),
                  Text(
                    ' ₽',
                    style: TextStyles.labelS.copyWith(
                      fontFamily: '',
                      height: 1,
                    ),
                  ),
                  Text('/шт', style: TextStyles.labelS),
                ],
              ),
              AppCircleButton(
                icon: Assets.icons.addToCard,
                buttonSize: 32,
                padding: 8,
                onTap: () => {},
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
