import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:market_test_project/core/network/api_client.dart';
import 'package:market_test_project/features/history/data/models/history_dto.dart';

abstract class HistoryRemoteDatasource {
  Future<HistoriesDTO> getHistories();
}

@LazySingleton(as: HistoryRemoteDatasource)
class HistoryRemoteDatasourceImpl implements HistoryRemoteDatasource {
  final ApiClient api;
  HistoryRemoteDatasourceImpl(Dio dio) : api = ApiClient(dio);

  @override
  Future<HistoriesDTO> getHistories() async {
    return await api.getHistory();
  }
}
