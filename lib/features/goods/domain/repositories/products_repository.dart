import 'package:market_test_project/features/goods/domain/entities/product_entity.dart';

abstract class ProductsRepository {
  Future<List<ProductEntity>> getProducts();
}
