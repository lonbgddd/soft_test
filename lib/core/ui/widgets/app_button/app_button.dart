import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.height = 50,
      this.width = double.infinity,
      required this.text,
      this.onPressed,
      this.textStyle,
      this.isLoading = false,
      this.isDisabled = false});

  final double height;
  final double width;
  final String text;
  final double borderRadius = 10;
  final TextStyle? textStyle;
  final Function()? onPressed;
  final bool isLoading;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDisabled ? Colors.black12 : Colors.yellowAccent,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(text,
                style: textStyle ??
                    TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
      ),
    );
  }
}
