import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/goods/data/datasources/goods_remote_datasource.dart';
import 'package:market_test_project/features/goods/domain/entities/product_entity.dart';
import 'package:market_test_project/features/goods/domain/repositories/products_repository.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final GoodsRemoteDatasource remote;

  ProductsRepositoryImpl(this.remote);

  @override
  Future<List<ProductEntity>> getProducts() async {
    var res = await remote.getProducts();
    return res.products
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
