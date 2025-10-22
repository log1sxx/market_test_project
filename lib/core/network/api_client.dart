import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:market_test_project/features/banners/data/models/banners_dto.dart';
import 'package:market_test_project/features/goods/data/models/products_dto.dart';
import 'package:market_test_project/features/history/data/models/history_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:market_test_project/core/network/api_path.dart';
part 'api_client.g.dart';

@injectable
@RestApi(baseUrl: ApiPath.baseUrl)
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(ApiPath.banners)
  Future<BannersDTO> getBanners();

  @GET(ApiPath.products)
  Future<ProductsDTO> getProducts();

  @GET(ApiPath.histories)
  Future<HistoriesDTO> getHistory();
}
