import 'package:flutter/material.dart';
import 'package:kafe/utils/colors.dart';

class NameText extends StatelessWidget {
  Color? color = AppColors.mainColor;
  final String text;
  double size;
  // TextOverflow overflow;

  NameText({
    Key? key,
    this.color,
    required this.text,
    this.size = 30,
    // this.overflow = TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: size,
          fontFamily: 'Lobster'),
    );
  }
}
