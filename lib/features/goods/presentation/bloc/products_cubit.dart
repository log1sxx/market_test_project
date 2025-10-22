// presentation/Products/Products_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/goods/domain/usecases/get_products_usecase.dart';
import 'products_state.dart';

@singleton
class ProductsCubit extends Cubit<ProductsState> {
  final GetProductsUsecase _getProductsUsecase;
  ProductsCubit(this._getProductsUsecase) : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    try {
      var res = await _getProductsUsecase();
      emit(ProductsLoaded(res));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
