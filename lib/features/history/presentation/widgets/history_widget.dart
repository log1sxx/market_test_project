import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_test_project/core/theme/app_fonts.dart';
import 'package:market_test_project/core/widgets/app_image_network.dart';
import 'package:market_test_project/features/history/domain/entities/history_entity.dart';

class HistoryWidget extends StatelessWidget {
  final HistoryEntity history;

  const HistoryWidget({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 63.w,
            height: 63.w,
            child: AppImageNetwork(imageUrl: history.imageLink),
          ),
          SizedBox(height: 5.h),
          Text(
            history.title,
            style: TextStyles.labelXS,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
