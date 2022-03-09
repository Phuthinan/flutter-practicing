// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แบบฟอร์มบันทึกข้อมูล"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: new InputDecoration(labelText: "ชื่อรายการ"),
                autofocus: true,
                //กดเข้ามาจะขึ้นให้พิมพ์ตรงนี้เลย
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "จำนวนเงิน"),
                keyboardType: TextInputType.number,
                //กำหนดให้แป้นพิมเป็นตัวเลข
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  //กลับไปหน้าก่อนหน้า เอาหน้าออก
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
