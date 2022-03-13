import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class displayScreen extends StatefulWidget {
  @override
  State<displayScreen> createState() => _displayScreenState();
}

class _displayScreenState extends State<displayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายงานคะแนนสอบ"),
      ),
      body: StreamBuilder(
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
              children: snapshot.data!.docs.map((document) {
            return Container(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: FittedBox(child: Text(document["score"])),
                ),
                title: Text(document["fname"] + document["lname"]),
                subtitle: Text(document["email"]),
              ),
            );
          }).toList());
        },
        stream: FirebaseFirestore.instance.collection("student").snapshots(),
      ),
    );
  }
}
