import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:market_test_project/features/goods/data/datasources/goods_local_datasource.dart';
import 'package:market_test_project/features/goods/data/datasources/goods_remote_datasource.dart';
import 'package:market_test_project/features/goods/data/models/products_dto.dart';
import 'package:market_test_project/features/goods/domain/entities/product_entity.dart';
import 'package:market_test_project/features/goods/domain/repositories/products_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final GoodsRemoteDatasource remote;
  final GoodsLocalDatasource local;
  final SharedPreferences sharedPreferences;
  final InternetConnectionChecker connectionChecker;
  ProductsRepositoryImpl(
    this.remote,
    this.local,
    this.sharedPreferences,
    this.connectionChecker,
  );

  @override
  Future<List<ProductEntity>> getProducts() async {
    ProductsDTO productsDTO;
    if (await connectionChecker.hasConnection) {
      productsDTO = await remote.getProducts();
      await sharedPreferences.setString(
        'cached_products',
        jsonEncode(productsDTO.toJson()),
      );
    } else {
      productsDTO = local.getProducts();
    }

    return productsDTO.products
        .map(
          (product) => ProductEntity(
            imageLink: product.image,
            price: product.price.toDouble(),
            productName: product.title,
          ),
        )
        .toList();
  }
}
