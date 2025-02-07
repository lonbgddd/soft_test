import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_cart/core/config/config.dart';
import 'package:shopping_cart/core/models/enums/load_status.dart';
import 'package:shopping_cart/core/ui/page/home/widgets/custom_widget.dart';
import 'package:shopping_cart/core/ui/page/home/widgets/hot_product_widget.dart';
import 'package:shopping_cart/core/ui/page/home/widgets/product_widget.dart';

import 'home_cubit.dart';
import 'widgets/bottom_sheet.dart';
import 'widgets/title_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return HomeCubit();
        },
        child: const HomeChildPage());
  }
}

class HomeChildPage extends StatefulWidget {
  const HomeChildPage({super.key});

  @override
  State<HomeChildPage> createState() => _HomeChildPageState();
}

class _HomeChildPageState extends State<HomeChildPage> {
  late final HomeCubit _cubit;

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
        title: Text('Home',
            style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white)),
        backgroundColor: Colors.yellow,
        actions: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return CartButton(
                count: state.count,
                onPressed: () {
                  GoRouter.of(context).pushNamed('cart').then(
                        (value) => _cubit.loadInitialData(),
                      );
                },
              );
            },
          )
        ],
      ),
      body: CustomScrollView(slivers: [
        buildTitleProductWidget(title: "Hot Product"),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return buildHotProductWidget(
              loading: state.loadDataStatus == LoadStatus.loading,
              onPressed: (model) {
                showBottomSheetAdd(
                    context: context,
                    model: model,
                    onSave: (p0) {
                      _cubit.addNewItem(count: p0.quantity, id: p0.productId);
                    });
              },
            );
          },
        ),
        buildTitleProductWidget(title: "Product"),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return buildProductWidget(
                loading: state.loadDataStatus == LoadStatus.loading,
                onPressed: (model) {
                  showBottomSheetAdd(
                      context: context,
                      model: model,
                      onSave: (p0) {
                        _cubit.addNewItem(count: p0.quantity, id: p0.productId);
                      });
                });
          },
        )
      ]),
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
