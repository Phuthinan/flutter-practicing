import 'package:flutter/material.dart';

//สร้าง widget ต้นแบบ

class MoneyBox extends StatelessWidget {
  String title;
  double amount;
  Color colorbox;
  double size;

  MoneyBox(this.title, this.amount, this.colorbox, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: colorbox,
          //กำหนดความโค้ง
          borderRadius: BorderRadius.circular(15)),
      height: size,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              amount.toStringAsFixed(2),
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
