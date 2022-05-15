import 'package:flutter/material.dart';
import 'package:kafe/utils/colors.dart';

class TopicText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  TopicText(
      {Key? key,
      this.color = const Color(0xFFF55897d),
      required this.text,
      this.size = 20,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      // overflow: overflow,
      // maxLines: 1,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w900,
          fontFamily: 'Inter',
          fontSize: size),
    );
  }
}
