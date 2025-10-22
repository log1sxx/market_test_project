import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/history/domain/entities/history_entity.dart';
import 'package:market_test_project/features/history/domain/repositories/histories_repository.dart';

@injectable
class GetHistoriesUsecase {
  final HistoriesRepository repository;
  GetHistoriesUsecase(this.repository);

  Future<List<HistoryEntity>> call() => repository.getHistories();
}
