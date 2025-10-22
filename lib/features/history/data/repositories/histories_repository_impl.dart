import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/history/data/datasources/history_remote_datasource.dart';
import 'package:market_test_project/features/history/domain/entities/history_entity.dart';
import 'package:market_test_project/features/history/domain/repositories/histories_repository.dart';

@Injectable(as: HistoriesRepository)
class HistoriesRepositoryImpl implements HistoriesRepository {
  final HistoryRemoteDatasource remote;

  HistoriesRepositoryImpl(this.remote);

  @override
  Future<List<HistoryEntity>> getHistories() async {
    var res = await remote.getHistories();
    return res.histories
        .map(
          (history) => HistoryEntity(
            imageLink: history.previewImage,
            title: history.title,
          ),
        )
        .toList();
  }
}
