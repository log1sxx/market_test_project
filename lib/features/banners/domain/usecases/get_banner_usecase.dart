import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/banners/domain/entities/banner.dart';
import 'package:market_test_project/features/banners/domain/repositories/banners_repository.dart';

@injectable
class GetBannerUsecase {
  final BannersRepository repository;
  GetBannerUsecase(this.repository);

  Future<List<Banner>> call() => repository.getBanners();
}
