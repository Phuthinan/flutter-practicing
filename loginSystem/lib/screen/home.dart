import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register/Login"),
      ),
      body: Column(
        children: [
          SizedBox(
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text(
                  "Register",
                  style: TextStyle(fontSize: 20),
                )),
          ),
          SizedBox(
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.login),
                label: Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
