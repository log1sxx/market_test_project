import 'package:market_test_project/features/history/domain/entities/history_entity.dart';

sealed class HistoriesState {}

class HistoriesInitial extends HistoriesState {}

class HistoriesLoading extends HistoriesState {}

class HistoriesLoaded extends HistoriesState {
  final List<HistoryEntity> histories;
  HistoriesLoaded(this.histories);
}

class HistoriesError extends HistoriesState {
  final String message;
  HistoriesError(this.message);
}
