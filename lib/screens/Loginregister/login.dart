import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:motion_toast/motion_toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  final storage = new FlutterSecureStorage();

  final key = GlobalKey<FormState>();
  String url = 'http://10.0.2.2:90/';
  // String url = 'http://192.168.137.39:90/';
  // String url = 'http://192.168.10.108:90/';

  String message = '';

  var userRole;
  var verified;
  Future<bool> login(String email_address, String password) async {
    Map<String, dynamic> body = {
      'username': email_address,
      'password': password,
    };
    var res = await http.post(Uri.parse(url + 'user/login-form'), body: body);
    var data = jsonDecode(res.body) as Map;
    print(data);
    userRole = data['userRole'];
    verified = data['verified'];
    var token = data['token'];
    print(token);
    if (data.isNotEmpty) {
      await storage.write(key: 'token', value: token);
      return true;
    }
    return false;
  }

  // notification for login success
  void notify() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'key1',
          title: 'Login pass',
          body: 'hello user',
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture:
              'https://images.idgesg.net/images/article/2019/01/android-q-notification-inbox-100785464-large.jpg?auto=webp&quality=85,70'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 30.0,
                      horizontal: 20.0,
                    ),
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      child: Image(
                        // height: 200,
                        // width: 100,
                        image: AssetImage(
                          "images/combo.jpg",
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
                        email = val!;
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
                        password = val!;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: 'Enter your Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
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
                        login(email, password).then((value) {
                          if (value) {
                            if (userRole == 1 || verified == 'true') {
                              Navigator.pushNamed(context, '/admin-homepage');
                            } else if (userRole == 0 || verified == 'false') {
                              notify();
                              Navigator.pushNamed(context, '/home');
                              MotionToast.success(
                                description: Text(
                                  "Login successfully",
                                ),
                              ).show(context);
                            } else {
                              print('Username or password not match');
                            }
                          }
                        });
                      },
                      child: Text(
                        'Login',
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
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
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          'Register',
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
