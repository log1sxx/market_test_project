// data/datasources/profile_remote_data_source.dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:market_test_project/core/network/api_client.dart';
import 'package:market_test_project/features/goods/data/models/products_dto.dart';

abstract class GoodsRemoteDatasource {
  Future<ProductsDTO> getProducts();
}

@LazySingleton(as: GoodsRemoteDatasource)
class GoodsRemoteDatasourceImpl implements GoodsRemoteDatasource {
  final ApiClient api;
  GoodsRemoteDatasourceImpl(Dio dio) : api = ApiClient(dio);

  @override
  Future<ProductsDTO> getProducts() async {
    return await api.getProducts();
  }
}
