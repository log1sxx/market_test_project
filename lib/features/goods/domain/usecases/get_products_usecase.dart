import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/goods/domain/entities/product_entity.dart';
import 'package:market_test_project/features/goods/domain/repositories/products_repository.dart';

@injectable
class GetProductsUsecase {
  final ProductsRepository repository;
  GetProductsUsecase(this.repository);

  Future<List<ProductEntity>> call() => repository.getProducts();
}
