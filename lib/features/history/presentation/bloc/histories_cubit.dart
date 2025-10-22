// presentation/Histories/Histories_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:market_test_project/features/history/domain/usecases/get_histories_usecase.dart';
import 'histories_state.dart';

@singleton
class HistoriesCubit extends Cubit<HistoriesState> {
  final GetHistoriesUsecase _getHistoriesUsecase;
  HistoriesCubit(this._getHistoriesUsecase) : super(HistoriesInitial());

  Future<void> getHistories() async {
    emit(HistoriesLoading());
    try {
      var res = await _getHistoriesUsecase();
      emit(HistoriesLoaded(res));
    } catch (e) {
      emit(HistoriesError(e.toString()));
    }
  }
}
