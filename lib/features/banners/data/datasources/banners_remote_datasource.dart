// data/datasources/profile_remote_data_source.dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:market_test_project/core/network/api_client.dart';
import 'package:market_test_project/features/banners/data/models/banners_dto.dart';

abstract class BannersRemoteDatasource {
  Future<BannersDTO> getBanners();
}

@LazySingleton(as: BannersRemoteDatasource)
class BannersRemoteDatasourceImpl implements BannersRemoteDatasource {
  final ApiClient api;
  BannersRemoteDatasourceImpl(Dio dio) : api = ApiClient(dio);

  @override
  Future<BannersDTO> getBanners() async {
    return await api.getBanners();
  }
}
