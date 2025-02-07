import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_cart/core/models/enums/load_status.dart';
import 'package:shopping_cart/core/ui/page/cart/widgets/custom_widget.dart';
import 'package:shopping_cart/core/ui/widgets/app_button/app_button.dart';

import 'cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CartCubit();
      },
      child: const CartChildPage(),
    );
  }
}

class CartChildPage extends StatefulWidget {
  const CartChildPage({super.key});

  @override
  State<CartChildPage> createState() => _CartChildPageState();
}

class _CartChildPageState extends State<CartChildPage> {
  late final CartCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of(context);
    _cubit.loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Text('Cart (${state.carts.length})',
                style: TextStyle(
                    fontWeight: FontWeight.w800, color: Colors.white));
          },
        ),
      ),
      extendBody: true,
      bottomSheet: Container(
        width: double.infinity,
        height: 150,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontSize: 18)),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Text('\$${state.total}',
                        style: TextStyle(fontSize: 18));
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            AppButton(
              onPressed: () {
                _cubit.removeAllProduct();
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Order Success'),
                          content: GestureDetector(
                            onTap: () {
                              GoRouter.of(context).pop();
                              GoRouter.of(context).pop();
                            },
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.yellowAccent,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text('Back to home page',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ));
              },
              text: "Order Now",
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: _buildBodyWidget(),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state.loadDataStatus == LoadStatus.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state.loadDataStatus == LoadStatus.failure
                ? const Center(
                    child: Text('Failed to load data'),
                  )
                : state.carts.isEmpty
                    ? const Center(
                        child: Text('No data found'),
                      )
                    : ListView.builder(
                        itemCount: state.carts.length,
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          return itemCart(
                              model: state.carts[index],
                              onDelete: (id) {
                                _cubit.removeProduct(id);
                              });
                        },
                      );
      },
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
