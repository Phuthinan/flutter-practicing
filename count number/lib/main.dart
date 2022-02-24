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
      theme: ThemeData(primarySwatch: Colors.green),
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
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Count number") //Header
          ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("กดปุ่ม"),
          Text(
            number.toString(),
            style: TextStyle(fontSize: 30),
          ),
        ],
      )), //Body
      floatingActionButton: FloatingActionButton(
        onPressed: addnumber,
        child: Icon(Icons.add_box),
      ),
    );
  }

  void addnumber() {
    setState(() {
      number++;
    });
  }
}
