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

class _myHomePageState extends State<myHomePage> {
  int number = 0;

  @override
  void initState() {
    super.initState();
    print("Hi iniState");
  }

  @override
  Widget build(BuildContext context) {
    print("Hi Build");
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
      body: Column(
        children: [Text(number.toString(), style: TextStyle(fontSize: 30))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            number++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
