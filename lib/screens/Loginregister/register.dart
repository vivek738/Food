import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String username = '';
  String email = '';
  String password = '';

  final key = GlobalKey<FormState>();
  String url = 'http://10.0.2.2:90/';
  // String url = 'http://192.168.137.39:90/';
  // String url = 'http://192.168.10.108:90/';

  String message = '';
  Future<bool> registerUser(
      String usernam, String email_address, String password) async {
    Map<dynamic, String> body = {
      'username': username,
      'email_address': email_address,
      'password': password,
    };

    var res =
        await http.post(Uri.parse(url + 'user/registration-form'), body: body);
    var jData = jsonDecode(res.body);
    print(jData);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("data"),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Form(
              key: key,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 350,
                      width: double.infinity,
                      child: Image(
                        image: AssetImage(
                          "images/momo.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: TextFormField(
                      onSaved: (val) {
                        username = val!;
                      },
                      decoration: InputDecoration(
                        hintText: "Username",
                        labelText: 'Enter your username',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: TextFormField(
                      onSaved: (val) {
                        email = val!;
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        labelText: 'Enter your email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_rounded),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: TextFormField(
                      onSaved: (val) {
                        password = val!;
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: 'Enter your Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          double.infinity,
                          50,
                        ),
                      ),
                      onPressed: () {
                        key.currentState!.save();
                        registerUser(username, email, password);
                        Navigator.pushNamed(context, "/login");
                        MotionToast.success(
                          description: Text(
                            "Account Created  Successfully",
                          ),
                        ).show(context);
                      },
                      child: Text(
                        'Register',
                        textScaleFactor: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Do not have an Account?',
                        textScaleFactor: 1.5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: Text(
                          'Login',
                          textScaleFactor: 1.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
