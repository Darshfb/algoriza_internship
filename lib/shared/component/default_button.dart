import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
   const DefaultButton(
      {Key? key,
      required this.text,
      required this.height,
      this.backgroundColor,
      this.textColor,
      this.width,
      this.radius = 10.0,
      this.onPressed})
      : super(key: key);
  final String text;
  final double height;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? radius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape:
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius!)),
      height: height,
      color: backgroundColor,
      minWidth: width,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
