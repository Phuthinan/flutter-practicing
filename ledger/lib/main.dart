import 'package:flutter/material.dart';

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
        appBar: AppBar(title: Text("บัญชีของฉัน") //Header
            ),
        //กำหนด list >10 ค่าขึ้นไป
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  //กำหนดความโค้ง
                  borderRadius: BorderRadius.circular(15)),
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.blue.shade200),
              height: 100,
            ),
          ],
        ));
  }
}
