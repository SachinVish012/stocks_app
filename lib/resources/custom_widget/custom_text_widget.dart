import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;

  const CustomText({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
