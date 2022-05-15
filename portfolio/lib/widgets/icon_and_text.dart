import 'package:flutter/material.dart';
import 'package:kafe/widgets/text/paragraph_text.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  String text;
  Color? color;
  IconText(
      {Key? key,
      required this.icon,
      required this.text,
      this.color = const Color(0xFF8f837f)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(width: 30, child: Icon(icon)),
          SizedBox(width: 10),
          Container(
            width: 300,
            child: ParagraphText(text: text),
          )
        ]));
  }
}
