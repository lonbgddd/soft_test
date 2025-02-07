import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_cart/core/models/entity/product.dart';
import 'package:shopping_cart/core/ui/widgets/app_button/app_button.dart';
import 'package:shopping_cart/core/ui/widgets/dialog/number_dialog.dart';
import 'package:shopping_cart/core/utils/ext/string_ext.dart';

class CartData {
  final int productId;
  final int quantity;

  CartData({required this.productId, required this.quantity});
}

Future<void> showBottomSheetAdd(
        {required BuildContext context,
        ProductModel? model,
        required Function(CartData) onSave}) =>
    showModalBottomSheet(
      context: context,
      builder: (context) {
        int count = 1;
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12), bottom: Radius.circular(0))),
                child: Column(children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          model?.imageUrl ?? 'cart'.withImage(type: 'png'),
                          width: 50,
                          height: 50,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(model?.name ?? "Product",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                          SizedBox(height: 10),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black38, width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        if (count > 1) {
                                          setState(() => count--);
                                        }
                                      },
                                      child: Icon(Icons.remove)),
                                  VerticalDivider(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      String? result = await showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return NumberInputDialog(
                                            product: model,
                                          );
                                        },
                                      );

                                      if (result != null) {
                                        setState(() {
                                          count = int.parse(result);
                                        });
                                      }
                                    },
                                    child: Text('$count'),
                                  ),
                                  VerticalDivider(width: 10),
                                  GestureDetector(
                                    child: Icon(Icons.add),
                                    onTap: () {
                                      if (count < 1000) {
                                        setState(() => count++);
                                      }
                                    },
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
                              onTap: () => GoRouter.of(context).pop(),
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.black38, width: 1),
                                  ),
                                  child: Icon(Icons.close))),
                          SizedBox(height: 10),
                          Text('${model?.price ?? 0} .đ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                  fontSize: 12))
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  AppButton(
                      text: "Add to cart",
                      onPressed: () {
                        onSave(CartData(
                            productId: model?.id ?? 0, quantity: count));
                        GoRouter.of(context).pop();
                      }),
                  SizedBox(height: 30)
                ]));
          },
        );
      },
    );
