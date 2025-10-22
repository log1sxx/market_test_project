import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:market_test_project/features/history/presentation/bloc/histories_cubit.dart';
import 'package:market_test_project/features/history/presentation/bloc/histories_state.dart';
import 'package:market_test_project/features/history/presentation/widgets/history_widget.dart';

class HistoriesHorizontalList extends StatefulWidget {
  const HistoriesHorizontalList({super.key});

  @override
  State<HistoriesHorizontalList> createState() =>
      _HistoriesHorizontalListState();
}

class _HistoriesHorizontalListState extends State<HistoriesHorizontalList> {
  final HistoriesCubit _historiesCubit = GetIt.I<HistoriesCubit>();

  @override
  void initState() {
    _historiesCubit.getHistories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _historiesCubit,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HistoriesLoaded) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            scrollDirection: Axis.horizontal,
            child: IntrinsicHeight(
              child: Row(
                children: [
                  for (
                    var index = 0;
                    index < state.histories.length;
                    index++
                  ) ...[
                    HistoryWidget(history: state.histories[index]),
                    if (state.histories.length != index + 1)
                      SizedBox(width: 10.w),
                  ],
                ],
              ),
            ),
          );
        }
        return SizedBox(
          height: 100,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
