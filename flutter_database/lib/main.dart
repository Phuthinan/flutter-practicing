import 'package:flutter/material.dart';
import 'package:flutter_database/models/transaction.dart';
import 'package:flutter_database/providers/transactionProvider.dart';
import 'package:flutter_database/screens/formScreen.dart';
import 'package:flutter_database/screens/homeScreen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        })
      ],
      child: MaterialApp(
        title: 'Account App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).starttData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, //กำหนดว่ามีกี่หน้า
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: TabBarView(//เลื่อนข้าง
              children: [homeScreen(), FormScreen()]),
          bottomNavigationBar: TabBar(tabs: [
            Tab(
              text: "รายการ",
              icon: Icon(Icons.list),
            ),
            Tab(
              text: "เพิ่มข้อมูล",
              icon: Icon(Icons.add),
            )
          ]),
        ));
    // homeScreen();
  }
}
