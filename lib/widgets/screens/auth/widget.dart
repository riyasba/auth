import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {
  final double? width;
  final double height;
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final Color textColor;

  CustomElevatedButton({
    Key? key,
    required this.color,
    required this.textColor,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            10,
          ),
          
        ),
        child: child,
      ),
    );
  }
}
