part of 'cart_cubit.dart';

class CartState extends Equatable {
  final LoadStatus loadDataStatus;
  final List<CartProduct> carts;
  final int total;

  const CartState({
    this.loadDataStatus = LoadStatus.initial,
    this.carts = const [],
    this.total = 0,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
        carts,
        total,
      ];

  CartState copyWith({
    LoadStatus? loadDataStatus,
    List<CartProduct>? carts,
    int? total,
  }) {
    return CartState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
      carts: carts ?? this.carts,
      total: total ?? this.total,
    );
  }
}
