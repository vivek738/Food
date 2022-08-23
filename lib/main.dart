import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/adminAddDishes.dart';
import 'package:flutter_application_1/Admin/adminAddMenuDetail.dart';
import 'package:flutter_application_1/Admin/adminDishDetails.dart';
import 'package:flutter_application_1/Admin/adminHome.dart';
import 'package:flutter_application_1/Admin/adminMenuDetails.dart';
import 'package:flutter_application_1/Admin/adminUpdateMenu.dart';
import 'package:flutter_application_1/Admin/updateDishes.dart';
import 'package:flutter_application_1/screens/Loginregister/getstarted.dart';
import 'package:flutter_application_1/screens/AddCart/addToCart.dart';
import 'package:flutter_application_1/screens/Dishes/dishes.dart';
import 'package:flutter_application_1/screens/HomePage/homepage.dart';
import 'package:flutter_application_1/screens/Loginregister/login.dart';
import 'package:flutter_application_1/screens/Loginregister/register.dart';
import 'package:flutter_application_1/screens/Menu/menu.dart';

void main() {
  AwesomeNotifications().initialize(
    null, // icon for your app notification
    [
      NotificationChannel(
          channelKey: 'key1',
          channelName: 'Proto Coders Point',
          channelDescription: "Notification example",
          defaultColor: const Color(0XFF9050DD),
          ledColor: Colors.white,
          playSound: true,
          enableLights: true,
          importance: NotificationImportance.High,
          enableVibration: true),
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amberAccent,
        primarySwatch: Colors.amber,
      ),
      title: "Delightfun Cafe",
      initialRoute: '/',
      routes: {
        '/': (context) => GetStarted(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/dish': (context) => DishHomepage(),
        '/menus': (context) => MenusDetails(),
        '/add-to-cart': (context) => AddToCart(),
        '/admin-homepage': (context) => AdminHomePage(),
        '/admin-add-dishes': (context) => AdminAddDishes(),
        '/admin-dishes': (context) => DishesDetails(),
        '/admin-update-dishes': (context) => AdminUpdateDishes(
              data: null,
            ),
        '/admin-menus': (context) => MenuDetails(),
        '/admin-add-menu': (context) => AdminMenuDetails(),
        '/admin-update-menu': (context) => AdminUpdateMenu(
              data: null,
            ),
      },
    );
  }
}
