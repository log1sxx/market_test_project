import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:market_test_project/core/constants/constants.dart';
import 'package:market_test_project/core/extensions/l10n_extension.dart';
import 'package:market_test_project/core/routes/app_router.dart';
import 'package:market_test_project/core/theme/app_colors.dart';
import 'package:market_test_project/core/theme/app_fonts.dart';
import 'package:market_test_project/gen/assets.gen.dart';

@RoutePage()
class AppRootScreen extends StatefulWidget {
  const AppRootScreen({super.key});

  @override
  State<AppRootScreen> createState() => _AppRootScreenState();
}

class _AppRootScreenState extends State<AppRootScreen> {
  final routes = [
    const HomeRoute(),
    const HomeRoute(),
    const HomeRoute(),
    const HomeRoute(),
    const HomeRoute(),
  ];
  final _icons = [
    Assets.icons.navBarIcons.mainNavBarIcon,
    Assets.icons.navBarIcons.marketNavBarIcon,
    Assets.icons.navBarIcons.mainNavBarIcon,
    Assets.icons.navBarIcons.deliveryNavBarIcon,
    Assets.icons.navBarIcons.contactNavBarIcon,
  ];
  late final _labels = [
    context.l10n.navbar_main,
    context.l10n.navbar_delivery,
    context.l10n.navbar_delivery,
    context.l10n.navbar_markets,
    context.l10n.navbar_contact,
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: ColorStyles.gray100,
      routes: routes,
      extendBody: true,
      bottomNavigationBuilder: (context, tabsRouter) {
        if (tabsRouter.topMatch.meta['hideBottomNav'] == true) {
          return const SizedBox.shrink();
        }
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            /*  boxShadow: const [BoxShadow(blurRadius: 16, color: Colors.black12)], */
          ),
          child: SafeArea(
            child: PopScope(
              canPop: tabsRouter.activeIndex == 0,
              onPopInvokedWithResult: (canPop, result) async {
                if (!canPop) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  tabsRouter.setActiveIndex(tabsRouter.activeIndex - 1);
                  tabsRouter.navigate(routes[tabsRouter.activeIndex]);
                }
              },
              child: MediaQuery.removePadding(
                context: context,
                removeBottom: true,
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  currentIndex: tabsRouter.activeIndex,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) async {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    tabsRouter.setActiveIndex(index);
                    tabsRouter.navigate(routes[index]);
                  },
                  useLegacyColorScheme: false,
                  selectedLabelStyle: TextStyles.h2.copyWith(fontSize: 0),
                  unselectedLabelStyle: TextStyles.h2.copyWith(fontSize: 0),
                  items: List.generate(
                    _labels.length,
                    (index) => index == 2
                        ? BottomNavigationBarItem(
                            label: '',
                            icon: SizedBox.shrink(),
                          )
                        : BottomNavigationBarItem(
                            label: '',
                            icon: _getIcon(
                              _icons[index],
                              _labels[index],
                              tabsRouter.activeIndex == index,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getIcon(SvgGenImage icon, String text, bool isActive) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13.h),
      child: Column(
        children: [
          AnimatedCrossFade(
            firstChild: getIcon(icon, ColorStyles.crimson400),
            secondChild: getIcon(icon, ColorStyles.gray800),
            crossFadeState: isActive
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: standartDuration,
          ),
          SizedBox(height: 5.h),
          AnimatedDefaultTextStyle(
            style: TextStyles.h7.copyWith(
              color: isActive ? ColorStyles.crimson400 : ColorStyles.gray800,
            ),
            duration: standartDuration,
            child: Text(text),
          ),
        ],
      ),
    );
  }

  SvgPicture getIcon(SvgGenImage icon, Color color) => icon.svg(
    width: 24.w,
    height: 24.h,
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
  );
}
