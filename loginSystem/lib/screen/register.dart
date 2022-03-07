import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_system/model/profile.dart';
import 'package:login_system/model/profile.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(title: Text("Error")),
              body: Center(child: Text("${snapshot.error}")),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Register"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email: ",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "please enter Email"),
                              EmailValidator(errorText: 'incorrect Email form')
                            ]),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (String? email) {
                              profile.email = email;
                            },
                          ),
                          Text(
                            "Password: ",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "please enter Password"),
                            obscureText: true,
                            onSaved: (String? password) {
                              profile.password = password;
                            },
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Text(
                                "Enter",
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState?.save();
                                  print(
                                      "email=${profile.email} password=${profile.password}");
                                  formKey.currentState?.reset();
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        }));
  }
}
