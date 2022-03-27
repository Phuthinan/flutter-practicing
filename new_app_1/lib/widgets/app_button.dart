import 'package:flutter/material.dart';
import 'package:new_app_1/utils/colors.dart';
import 'package:new_app_1/widgets/small_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;
  AppButtons(
      {Key? key,
      this.isIcon = false,
      this.text,
      this.icon,
      required this.color,
      required this.backgroundColor,
      required this.borderColor,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor),
        child: isIcon == false
            ? Center(
                child: SmallText(
                  size: 20,
                  text: text!,
                  color: color,
                ),
              )
            : Center(
                child: Icon(
                  icon,
                  color: color,
                ),
              ));
  }
}
