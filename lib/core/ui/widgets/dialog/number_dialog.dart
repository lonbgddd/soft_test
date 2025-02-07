import 'package:flutter/material.dart';
import 'package:shopping_cart/core/models/entity/product.dart';
import 'package:shopping_cart/core/ui/widgets/app_button/app_button.dart';

class NumberInputDialog extends StatefulWidget {
  const NumberInputDialog({super.key, this.product});

  final ProductModel? product;

  @override
  State<StatefulWidget> createState() => _NumberInputDialogState();
}

class _NumberInputDialogState extends State<NumberInputDialog> {
  int count = 1;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = "$count";
  }

  @override
  Widget build(BuildContext context) {
    bool isValid = count > 0 && count <= 999;
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.product?.name ?? 'Product',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          width: 2,
                          color: isValid ? Colors.yellowAccent : Colors.red)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          width: 2,
                          color: isValid ? Colors.yellowAccent : Colors.red))),
              onChanged: (value) {
                setState(() {
                  count = int.tryParse(value) ?? 1;
                });
              },
            ),
            !isValid
                ? Text("Quantity must be between 1 and 999",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ))
                : SizedBox(),
            SizedBox(height: 32),
            AppButton(
                text: 'Submit',
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                isLoading: false,
                isDisabled: !isValid,
                onPressed: () {
                  Navigator.pop(context, count.toString());
                }),
          ],
        ),
      ),
    );
  }
}
