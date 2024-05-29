import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final Color color;
  final IconData? icon;
  final EdgeInsetsGeometry margin;

  const CustomAuthButton({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.color,
    required this.margin,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 30,
                color: Colors.black,
              ),
            Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
