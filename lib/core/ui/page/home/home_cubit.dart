import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_cart/core/database/local/database.dart';

import '../../../models/enums/load_status.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
  AppDatabase database = AppDatabase.instance;

  Future<void> loadInitialData() async {
    emit(state.copyWith(loadDataStatus: LoadStatus.loading));
    try {
      Future.delayed(Duration(seconds: 2)).then(
        (value) {
          emit(state.copyWith(
              loadDataStatus: LoadStatus.success,
              count: database.getCacheSize()));
        },
      );
    } catch (e, _) {
      emit(state.copyWith(loadDataStatus: LoadStatus.failure));
    }
  }

  Future addNewItem({required int id, required int count}) async {
    emit(state.copyWith(loadDataStatus: LoadStatus.loading));
    try {
      database.setCache({
        'id': id,
        'count': count,
      });
      loadInitialData();
      emit(state.copyWith(loadDataStatus: LoadStatus.success));
    } catch (e, _) {
      emit(state.copyWith(loadDataStatus: LoadStatus.failure));
    }
  }
}
