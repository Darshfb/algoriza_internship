import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isUpperCase,
    this.color,
  }) : super(key: key);
  final String text;
  final VoidCallback? onPressed;
  final bool? isUpperCase;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        isUpperCase == true ? text.toUpperCase() : text,
        style: TextStyle(
          color: color ?? Colors.blue,
        ),
      ),
    );
  }
}
