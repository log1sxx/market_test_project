import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:market_test_project/core/theme/app_fonts.dart';
import 'package:market_test_project/core/widgets/app_circle_button.dart';
import 'package:market_test_project/features/banners/presentation/widgets/banners_carousel_widget.dart';
import 'package:market_test_project/features/fcm_notifications/presentation/bloc/notification_event.dart';
import 'package:market_test_project/features/fcm_notifications/presentation/bloc/notification_state.dart';
import 'package:market_test_project/features/fcm_notifications/presentation/bloc/notifications_bloc.dart';
import 'package:market_test_project/features/goods/presentation/widgets/products_horizontal_list.dart';
import 'package:market_test_project/features/history/presentation/widgets/histories_horizontal_list.dart';
import 'package:market_test_project/gen/assets.gen.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotificationBloc notificationBloc = GetIt.I<NotificationBloc>();
  @override
  void initState() {
    notificationBloc.add(InitNotifications());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(15),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Assets.icons.profile.svg(),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          'Анна',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.titleh4,
                        ),
                      ),
                    ],
                  ),
                ),
                ...[
                  AppCircleButton(
                    icon: Assets.icons.mark,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 3),
                  AppCircleButton(
                    icon: Assets.icons.bell,
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ],
            ),
          ),
        ),
        actions: const [],
        leading: const SizedBox.shrink(),
      ),

      body: BlocListener(
        bloc: notificationBloc,
        listener: (context, state) {
          if (state is InitNotificationsNetworkError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Нет соединения с интернетом!')),
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HistoriesHorizontalList(),
              const SizedBox(height: 15),
              const BannersCarouselWidget(),
              const SizedBox(height: 25),
              const ProductsHorizontalList(),
            ],
          ),
        ),
      ),
    );
  }
}
