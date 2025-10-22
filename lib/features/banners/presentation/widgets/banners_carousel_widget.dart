import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:market_test_project/core/constants/constants.dart';
import 'package:market_test_project/core/theme/app_colors.dart';
import 'package:market_test_project/core/widgets/app_image_network.dart';
import 'package:market_test_project/features/banners/presentation/bloc/banners_cubit.dart';
import 'package:market_test_project/features/banners/presentation/bloc/banners_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannersCarouselWidget extends StatefulWidget {
  const BannersCarouselWidget({super.key});

  @override
  State<BannersCarouselWidget> createState() => _BannersCarouselWidgetState();
}

class _BannersCarouselWidgetState extends State<BannersCarouselWidget> {
  final BannersCubit _bannersCubit = GetIt.I<BannersCubit>();
  PageController _pageController = PageController();
  @override
  void initState() {
    _bannersCubit.getBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _bannersCubit,
      listener: (context, BannersState state) {},
      builder: (context, BannersState state) {
        if (state is BannersLoaded) {
          return Column(
            children: [
              SizedBox(
                height: 150.h,
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (ctx, index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: AppImageNetwork(
                      imageUrl: state.banners[index].imageLink,
                    ),
                  ),
                  itemCount: state.banners.length,
                ),
              ),
              const SizedBox(height: 10),
              SmoothPageIndicator(
                controller: _pageController,
                count: state.banners.length,
                effect: ExpandingDotsEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  expansionFactor: 4,
                  spacing: 5,
                  activeDotColor: ColorStyles.gray200,
                  dotColor: ColorStyles.gray200.withValues(alpha: 0.5),
                ),
                onDotClicked: (index) => _pageController.animateToPage(
                  index,
                  duration: standartDuration,
                  curve: Curves.easeIn,
                ),
              ),
            ],
          );
        }
        if (state is BannersError) return SizedBox.shrink();
        return SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
