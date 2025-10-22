import 'package:market_test_project/features/history/domain/entities/history_entity.dart';

abstract class HistoriesRepository {
  Future<List<HistoryEntity>> getHistories();
}
