import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/model/student.dart';
import 'package:form_field_validator/form_field_validator.dart';

class formScreen extends StatefulWidget {
  @override
  State<formScreen> createState() => _formScreenState();
}

class _formScreenState extends State<formScreen> {
  final formKey = GlobalKey<FormState>();
  student myStudent = student(fname: '', lname: '', email: '', score: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference studentCollection =
      FirebaseFirestore.instance.collection("student");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แบบฟอร์มบันทึกคะแนนสอบ"),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ชื่อ",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      validator: RequiredValidator(errorText: "กรุณาป้อนชื่อ"),
                      onSaved: (String? fname) {
                        myStudent.fname = fname!;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "นามสกุล",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      validator:
                          RequiredValidator(errorText: "กรุณาป้อนนามสกุล"),
                      onSaved: (String? lname) {
                        myStudent.lname = lname!;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "อีเมล",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: MultiValidator([
                        RequiredValidator(errorText: "กรุณาป้อนอีเมล"),
                        EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
                      ]),
                      onSaved: (String? emal) {
                        myStudent.email = emal!;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "คะแนน",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: RequiredValidator(errorText: "กรุณาป้อนคะแนน"),
                      onSaved: (String? score) {
                        myStudent.score = score!;
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text(
                          "บันทึกข้อมูล",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            await studentCollection.add({
                              "fname": myStudent.fname,
                              "lname": myStudent.lname,
                              "email": myStudent.email,
                              "score": myStudent.score
                            });
                            formKey.currentState!.reset();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
