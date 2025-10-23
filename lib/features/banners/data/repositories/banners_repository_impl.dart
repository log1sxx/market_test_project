import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:market_test_project/features/banners/data/datasources/banners_local_datasource.dart';
import 'package:market_test_project/features/banners/data/datasources/banners_remote_datasource.dart';
import 'package:market_test_project/features/banners/data/models/banners_dto.dart';
import 'package:market_test_project/features/banners/domain/entities/banner.dart';
import 'package:market_test_project/features/banners/domain/repositories/banners_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: BannersRepository)
class BannersRepositoryImpl implements BannersRepository {
  final BannersRemoteDatasource remote;
  final BannersLocalDatasource local;
  final InternetConnectionChecker connectionChecker;
  final SharedPreferences sharedPreferences;
  BannersRepositoryImpl(
    this.remote,
    this.local,
    this.connectionChecker,
    this.sharedPreferences,
  );

  @override
  Future<List<Banner>> getBanners() async {
    BannersDTO bannersDTO;
    if (await connectionChecker.hasConnection) {
      bannersDTO = await remote.getBanners();
      await sharedPreferences.setString(
        'cached_banners',
        jsonEncode(bannersDTO.toJson()),
      );
    } else {
      bannersDTO = await local.getBanners();
    }
    return bannersDTO.banners
        .map((bannerDto) => Banner(imageLink: bannerDto.image))
        .toList();
  }
}
