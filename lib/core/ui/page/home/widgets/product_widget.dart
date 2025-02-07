import 'package:flutter/material.dart';
import 'package:shopping_cart/core/models/entity/product.dart';
import 'package:shopping_cart/core/ui/page/home/widgets/hot_product_widget.dart';
import 'package:shopping_cart/core/ui/widgets/shimmer/container_shimmer.dart';

import '../../../../config/config.dart';

Widget buildProductWidget(
    {void Function(ProductModel)? onPressed, bool loading = false}) {
  return loading
      ? SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return buildShimmerLoading(
                margin: const EdgeInsets.all(16),
                height: 200,
              );
            },
            childCount: 6, // Set the number of shimmer items you want
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
        )
      : SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return productView(AppConfig.products[index],
                    isHot: false,
                    onPressed: () =>
                        onPressed?.call(AppConfig.products[index]));
              },
              childCount: AppConfig.products.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8),
          ),
        );
}
