import 'package:flutter/material.dart';
import 'package:kafe/utils/colors.dart';

class ParagraphText extends StatelessWidget {
  Color? color;
  final String text;
  double size;

  ParagraphText({
    Key? key,
    this.color = const Color(0xFF8f837f),
    required this.text,
    this.size = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontFamily: 'Inter'),
    );
  }
}
