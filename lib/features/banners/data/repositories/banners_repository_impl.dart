import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/banners/data/datasources/banners_remote_datasource.dart';
import 'package:market_test_project/features/banners/domain/entities/banner.dart';
import 'package:market_test_project/features/banners/domain/repositories/banners_repository.dart';

@Injectable(as: BannersRepository)
class BannersRepositoryImpl implements BannersRepository {
  final BannersRemoteDatasource remote;

  BannersRepositoryImpl(this.remote);

  @override
  Future<List<Banner>> getBanners() async {
    var res = await remote.getBanners();
    return res.banners
        .map((bannerDto) => Banner(imageLink: bannerDto.image))
        .toList();
  }
}
