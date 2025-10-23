// data/datasources/profile_remote_data_source.dart
import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/banners/data/models/banners_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BannersLocalDatasource {
  Future<BannersDTO> getBanners();
}

@LazySingleton(as: BannersLocalDatasource)
class BannersRemoteDatasourceImpl implements BannersLocalDatasource {
  final SharedPreferences sharedPreferences;
  BannersRemoteDatasourceImpl(this.sharedPreferences);

  @override
  Future<BannersDTO> getBanners() async {
    var cachedBannersDTO = sharedPreferences.getString('cached_banners') ?? '';
    return BannersDTO.fromJson(jsonDecode(cachedBannersDTO));
  }
}
