// presentation/Banners/Banners_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/banners/domain/entities/banner.dart';
import 'package:market_test_project/features/banners/domain/usecases/get_banner_usecase.dart';
import 'banners_state.dart';

@singleton
class BannersCubit extends Cubit<BannersState> {
  final GetBannerUsecase getBannerUsecase;
  BannersCubit(this.getBannerUsecase) : super(BannersInitial());

  List<Banner>? banners;

  bool get bannersIsNotEmpty => banners != null;

  Future<void> getBanners() async {
    emit(BannersLoading());
    try {
      banners = await getBannerUsecase();
      emit(BannersLoaded(banners ?? []));
    } catch (e) {
      emit(BannersError(e.toString()));
    }
  }
}
