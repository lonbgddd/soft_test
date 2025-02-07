import 'package:shopping_cart/core/models/entity/product.dart';

class CartProduct {
  final ProductModel product;
  final int quantity;
  final int id;

  CartProduct(
      {required this.product, required this.quantity, required this.id});
}
