import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_cart/core/config/config.dart';

import '../../../models/enums/load_status.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  Future<void> loadInitialData(context) async {
    Future.delayed(AppConfig.durationLoading).then((value) {
      GoRouter.of(context).pushReplacementNamed('home');
    });
  }
}
