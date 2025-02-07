import 'package:flutter/material.dart';
import 'package:shopping_cart/core/models/entity/cart_product.dart';

Widget itemCart({required CartProduct model, Function(int)? onDelete}) =>
    StatefulBuilder(
      builder: (context, setState) {
        return Container(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 5))
                ]),
            child: Column(children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      model.product.imageUrl,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(model.product.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18)),
                      SizedBox(height: 10),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {}, child: Icon(Icons.remove)),
                              VerticalDivider(
                                width: 10,
                              ),
                              Text('${model.quantity}'),
                              VerticalDivider(width: 10),
                              GestureDetector(
                                child: Icon(Icons.add),
                                onTap: () {},
                              )
                            ]),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () => onDelete?.call(model.id),
                          child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.black38, width: 1),
                              ),
                              child: Icon(Icons.close))),
                      SizedBox(height: 10),
                      Text('${model.product.price ?? 0} .đ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                              fontSize: 12))
                    ],
                  )
                ],
              )
            ]));
      },
    );
