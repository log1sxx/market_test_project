// data/datasources/profile_remote_data_source.dart
import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/history/data/models/history_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HistoriesLocalDatasource {
  HistoriesDTO getHistories();
}

@LazySingleton(as: HistoriesLocalDatasource)
class HistoriesLocalDatasourceImpl implements HistoriesLocalDatasource {
  final SharedPreferences sharedPreferences;
  HistoriesLocalDatasourceImpl(this.sharedPreferences);

  @override
  HistoriesDTO getHistories() {
    var chachedProductsDTO = sharedPreferences.getString('histories_dto');
    if (chachedProductsDTO != null) {
      return HistoriesDTO.fromJson(jsonDecode(chachedProductsDTO));
    } else {
      throw Exception();
    }
  }
}
