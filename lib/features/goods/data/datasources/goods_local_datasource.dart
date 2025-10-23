// data/datasources/profile_remote_data_source.dart
import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/goods/data/models/products_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GoodsLocalDatasource {
  ProductsDTO getProducts();
}

@LazySingleton(as: GoodsLocalDatasource)
class GoodsLocalDatasourceImpl implements GoodsLocalDatasource {
  final SharedPreferences sharedPreferences;
  GoodsLocalDatasourceImpl(this.sharedPreferences);

  @override
  ProductsDTO getProducts() {
    var chachedProductsDTO = sharedPreferences.getString('products_dto');
    if (chachedProductsDTO != null) {
      return ProductsDTO.fromJson(jsonDecode(chachedProductsDTO));
    } else {
      throw Exception();
    }
  }
}
