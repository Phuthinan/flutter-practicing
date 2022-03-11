import 'package:flutter/material.dart';
import 'package:flutter_database/models/transaction.dart';
import 'package:flutter_database/screens/formScreen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/transactionProvider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).starttData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Account App"),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Navigator.push(context, MaterialPageRoute(builder: (context) {
          //           return FormScreen();
          //         }));
          //       },
          //       icon: Icon(Icons.add))
          // ],
        ),
        body: Consumer(builder: (context, TransactionProvider trans, child) {
          var count = trans.transaction.length;
          if (count <= 0) {
            return Center(
              child: Text(
                "ไม่พบข้อมูล",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: trans.transaction.length,
                itemBuilder: (context, int index) {
                  Transactions data = trans.transaction[index];
                  return Card(
                    elevation: 5, //drop shadow ค่ามากเงาเยอะ
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 5), //กำหนดระยะห่างของ card จากขอบ
                    child: ListTile(
                        leading: CircleAvatar(
                            child: FittedBox(
                          child: Text(data.amount.toString()),
                        )),
                        title: Text(data.title),
                        subtitle: Text(
                            'Date: ${DateFormat("dd/MM/yyyy").format(data.date)}')),
                  );
                });
          }
        }));
  }
}
