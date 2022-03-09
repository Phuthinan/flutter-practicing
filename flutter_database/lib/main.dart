import 'package:flutter/material.dart';
import 'package:flutter_database/screens/formScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Account App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormScreen();
                }));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, int index) {
            return Card(
              elevation: 5, //drop shadow ค่ามากเงาเยอะ
              margin: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 5), //กำหนดระยะห่างของ card จากขอบ
              child: ListTile(
                leading: CircleAvatar(
                    child: FittedBox(
                  child: Text("500"),
                )),
                title: Text("รายการ"),
                subtitle: Text("09/03/2022"),
              ),
            );
          }),
    );
  }
}
