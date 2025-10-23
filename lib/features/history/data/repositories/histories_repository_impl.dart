import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:market_test_project/features/history/data/datasources/history_local_datasource.dart';
import 'package:market_test_project/features/history/data/datasources/history_remote_datasource.dart';
import 'package:market_test_project/features/history/data/models/history_dto.dart';
import 'package:market_test_project/features/history/domain/entities/history_entity.dart';
import 'package:market_test_project/features/history/domain/repositories/histories_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: HistoriesRepository)
class HistoriesRepositoryImpl implements HistoriesRepository {
  final HistoryRemoteDatasource remote;
  final HistoriesLocalDatasource local;
  final SharedPreferences sharedPreferences;
  final InternetConnectionChecker connectionChecker;
  HistoriesRepositoryImpl(
    this.remote,
    this.local,
    this.sharedPreferences,
    this.connectionChecker,
  );

  @override
  Future<List<HistoryEntity>> getHistories() async {
    HistoriesDTO historiesDTO;
    if (await connectionChecker.hasConnection) {
      historiesDTO = await remote.getHistories();
      await sharedPreferences.setString(
        'histories_dto',
        jsonEncode(historiesDTO.toJson()),
      );
    } else {
      historiesDTO = local.getHistories();
    }

    return historiesDTO.histories
        .map(
          (history) => HistoryEntity(
            imageLink: history.previewImage,
            title: history.title,
          ),
        )
        .toList();
  }
}
