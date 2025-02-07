import 'package:flutter/material.dart';
import 'package:shopping_cart/core/config/config.dart';
import 'package:shopping_cart/core/models/entity/product.dart';
import 'package:shopping_cart/core/ui/widgets/shimmer/container_shimmer.dart';

Widget buildHotProductWidget(
    {void Function(ProductModel)? onPressed, bool loading = false}) {
  return SliverToBoxAdapter(
      child: SizedBox(
          height: 250,
          child: loading
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return buildShimmerLoading(
                      margin:
                          const EdgeInsets.only(right: 16, top: 12, bottom: 12),
                      height: 200,
                    );
                  },
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  itemCount: AppConfig.products.length,
                  itemBuilder: (context, index) {
                    return productView(
                      AppConfig.products[index],
                      onPressed: () =>
                          onPressed?.call(AppConfig.products[index]),
                    );
                  })));
}

Widget productView(ProductModel model,
        {void Function()? onPressed, bool isHot = true}) =>
    Container(
        width: 150,
        margin: isHot
            ? EdgeInsets.only(right: 16, top: 12, bottom: 12)
            : EdgeInsets.all(0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(5, 5))
            ]),
        child: SizedBox(
          height: 250,
          child: Column(children: [
            ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Stack(
                  children: [
                    Image.asset(model.imageUrl,
                        fit: BoxFit.cover, width: double.infinity, height: 150),
                    isHot
                        ? Container(
                            width: 30,
                            height: 30,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(5, 5))
                                ]),
                            child: Icon(Icons.local_fire_department_rounded,
                                color: Colors.red),
                          )
                        : const SizedBox(),
                  ],
                )),
            Spacer(),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(model.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(height: 4),
                            Text(
                              "${model.price} VND",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                              ),
                            )
                          ]),
                      IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.yellow,
                        ),
                      )
                    ]))
          ]),
        ));
