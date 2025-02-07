import 'package:go_router/go_router.dart';
import 'package:shopping_cart/core/models/entity/product.dart';
import 'package:shopping_cart/core/ui/page/cart/cart_page.dart';
import 'package:shopping_cart/core/ui/page/home/home_page.dart';
import 'package:shopping_cart/core/ui/page/splash/splash_page.dart';
import 'package:shopping_cart/core/utils/ext/string_ext.dart';

class AppConfig {
  static const String appName = "Shopping Cart";

  static List<ProductModel> products = [
    ProductModel.fromJson({
      "id": 1,
      "name": "Product 1",
      "price": 180000,
      "image": "product_1".withImage()
    }),
    ProductModel.fromJson({
      "id": 2,
      "name": "Product 2",
      "price": 200000,
      "image": "product_2".withImage()
    }),
    ProductModel.fromJson({
      "id": 3,
      "name": "Product 3",
      "price": 220000,
      "image": "product_3".withImage()
    }),
    ProductModel.fromJson({
      "id": 4,
      "name": "Product 4",
      "price": 240000,
      "image": "product_4".withImage()
    }),
    ProductModel.fromJson({
      "id": 5,
      "name": "Product 5",
      "price": 260000,
      "image": "product_5".withImage()
    }),
    ProductModel.fromJson({
      "id": 6,
      "name": "Product 6",
      "price": 280000,
      "image": "product_6".withImage()
    }),
    ProductModel.fromJson({
      "id": 7,
      "name": "Product 7",
      "price": 300000,
      "image": "product_7".withImage()
    }),
    ProductModel.fromJson({
      "id": 8,
      "name": "Product 8",
      "price": 320000,
      "image": "product_8".withImage()
    }),
    ProductModel.fromJson({
      "id": 9,
      "name": "Product 9",
      "price": 340000,
      "image": "product_9".withImage()
    })
  ];

  static GoRouter routerConfig = GoRouter(initialLocation: '/', routes: [
    GoRoute(path: '/', builder: (context, state) => SplashPage()),
    GoRoute(
        path: '/home', name: 'home', builder: (context, state) => HomePage()),
    GoRoute(
        path: '/cart', name: 'cart', builder: (context, state) => CartPage()),
  ]);

  static Duration durationLoading = const Duration(seconds: 3);
}
