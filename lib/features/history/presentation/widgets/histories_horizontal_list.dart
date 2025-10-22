import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:market_test_project/core/widgets/app_horizontal_list.dart';
import 'package:market_test_project/features/history/domain/entities/history_entity.dart';
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
          return AppHorizontalList<HistoryEntity>(
            items: state.histories,
            itemBuilder: (context, item, index) => HistoryWidget(history: item),
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
