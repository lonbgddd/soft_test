import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_cart/core/config/config.dart';
import 'package:shopping_cart/core/database/local/database.dart';
import 'package:shopping_cart/core/models/entity/cart_product.dart';

import '../../../models/enums/load_status.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());
  AppDatabase database = AppDatabase.instance;

  Future<void> loadInitialData() async {
    emit(state.copyWith(loadDataStatus: LoadStatus.initial));
    try {
      Map<String, dynamic> carts = database.getCache();
      List<CartProduct> cartProducts = [];
      carts.forEach(
        (key, value) {
          cartProducts.add(CartProduct(
            product: AppConfig.products
                .where((element) =>
                    element.id == (value as Map<String, dynamic>)['id'])
                .first,
            quantity: (value as Map<String, dynamic>)['count'],
            id: int.parse(key),
          ));
        },
      );

      int total = 0;
      for (var element in cartProducts) {
        total += element.product.price * element.quantity;
      }

      emit(state.copyWith(
          loadDataStatus: LoadStatus.success,
          carts: cartProducts.reversed.toList(),
          total: total));
    } catch (e, _) {
      emit(state.copyWith(loadDataStatus: LoadStatus.failure));
    }
  }

  void removeProduct(int cartProduct) {
    database.removeCache(cartProduct.toString());
    loadInitialData();
  }

  void removeAllProduct() {
    database.clearCache();
    loadInitialData();
  }
}
