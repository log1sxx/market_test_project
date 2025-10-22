import 'package:market_test_project/features/banners/domain/entities/banner.dart';

sealed class BannersState {}

class BannersInitial extends BannersState {}

class BannersLoading extends BannersState {}

class BannersLoaded extends BannersState {
  final List<Banner> banners;
  BannersLoaded(this.banners);
}

class BannersError extends BannersState {
  final String message;
  BannersError(this.message);
}
