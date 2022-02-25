import 'package:flutter/material.dart';
import 'MoneyBox.dart';

void main() {
  runApp(MyApp());
}

//Stateless เปลี่ยนค่าไม่ได้
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: myHomePage(),
      theme: ThemeData(primarySwatch: Colors.lightBlue),
    );
  }
}

class myHomePage extends StatefulWidget {
  const myHomePage({Key? key}) : super(key: key);

  @override
  _myHomePageState createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "บัญชีของฉัน",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ) //Header
            ),
        //กำหนด list >10 ค่าขึ้นไป
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              MoneyBox("ยอดคงเหลือ", 200000.25, Colors.blue.shade200, 150),
              SizedBox(
                height: 8,
              ),
              MoneyBox("รายรับ", 300000.350, Colors.green.shade200, 100),
              SizedBox(
                height: 8,
              ),
              MoneyBox("รายจ่าย", 10000, Colors.red.shade200, 100),
            ],
          ),
        ));
  }
}
