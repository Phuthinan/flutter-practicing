// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_database/models/transaction.dart';
import 'package:flutter_database/providers/transactionProvider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  //controller
  final titleController = TextEditingController(); // รับชื่อรายการ
  final amountController = TextEditingController(); // รับจำนวนเงิน

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แบบฟอร์มบันทึกข้อมูล"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: new InputDecoration(labelText: "ชื่อรายการ"),
                autofocus: true, //กดเข้ามาจะขึ้นให้พิมพ์ตรงนี้เลย
                controller: titleController,
                validator: (String? str) {
                  if (str!.isEmpty) {
                    return "กรุณาป้อนชื่อรายการ";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "จำนวนเงิน"),
                keyboardType: TextInputType.number,
                controller: amountController,
                validator: (String? str) {
                  if (str!.isEmpty) {
                    return "กรุณาป้อนจำนวนเงิน";
                  }
                  if (double.parse(str) <= 0) {
                    return "กรุณาป้อนตัวเลขมากกว่า0";
                  }
                  return null;
                },
                //กำหนดให้แป้นพิมเป็นตัวเลข
              ),
              FlatButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    var title = titleController.text;
                    var amount = amountController.text;
                    // print("Title: $title amout: $amount");

                    //เตรียมข้อมูล
                    Transactions statement = Transactions(
                        title: title,
                        amount: double.parse(amount),
                        date: DateTime.now());
                    //เรียก provider
                    var provider = Provider.of<TransactionProvider>(context,
                        listen: false);
                    provider.addTransaction(statement);
                    Navigator.pop(context); //กลับไปหน้าก่อนหน้า เอาหน้าออก
                  }
                },
                child: Text("เพิ่มข้อมูล"),
                textColor: Colors.white,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
