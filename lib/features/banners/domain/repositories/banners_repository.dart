import 'package:market_test_project/features/banners/domain/entities/banner.dart';

abstract class BannersRepository {
  Future<List<Banner>> getBanners();
}
