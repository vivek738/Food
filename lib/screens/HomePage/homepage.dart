import 'dart:async';
import 'dart:convert';
import 'package:flutter_application_1/screens/Loginregister/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storage = new FlutterSecureStorage();
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];
  String url = 'http://10.0.2.2:90/';
  // String url = 'http://192.168.137.39:90/';
  // String url = 'http://192.168.10.108:90/';

  card() async {
    var token = await storage.read(key: 'token');
    // print(token);

    var res = await http.get(Uri.parse(url + 'get/card'),
        headers: {'Authorization': 'Bearer $token'});
    var d = jsonDecode(res.body);
    // print(d);
    return d;
  }

  void initState() {
    super.initState();
    card().then((res) {
      setState(() {
        return res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Delightful",
              style: TextStyle(
                color: Colors.yellow.shade900,
              ),
            ),
            Text(
              " Cafe",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
            ),
            child: Icon(
              Icons.notification_add_outlined,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add-to-cart');
            },
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Vivek Sah"),
              accountEmail: Text("Viveksah9800@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(
                    "images/friedchicken.jpg",
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              hoverColor: Colors.amberAccent,
              title: Text("Home"),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            Divider(
              thickness: 1.2,
            ),
            ListTile(
              leading: Icon(
                Icons.info,
              ),
              hoverColor: Colors.blue[50],
              title: Text("About"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              thickness: 1.2,
            ),
            ListTile(
              leading: Icon(
                Icons.food_bank_rounded,
              ),
              hoverColor: Colors.blue[50],
              title: Text("Dishes"),
              onTap: () {
                Navigator.pushNamed(context, '/dish');
              },
            ),
            Divider(
              thickness: 1.2,
            ),
            ListTile(
              leading: Icon(
                Icons.food_bank,
              ),
              hoverColor: Colors.blue[50],
              title: Text("Menu"),
              onTap: () {
                Navigator.pushNamed(context, '/menus');
              },
            ),
            Divider(
              thickness: 1.2,
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.shopping_bag_rounded,
            //   ),
            //   hoverColor: Colors.blue[50],
            //   title: Text("Orders"),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            // Divider(
            //   thickness: 1.2,
            // ),
            ListTile(
              leading: Icon(
                Icons.contacts,
                color: Colors.blue,
              ),
              hoverColor: Colors.amberAccent,
              title: Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              thickness: 1.2,
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.blue,
              ),
              hoverColor: Colors.amberAccent,
              title: Text("Log out"),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            Divider(
              thickness: 1.2,
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: "Search Here...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Items ",
                      textScaleFactor: 2,
                    ),
                  ),
                  // carousel-items
                  CarouselSlider(
                    items: [
                      Container(
                        width: double.infinity,
                        height: 250,
                        margin: EdgeInsets.only(
                          left: 0,
                          right: 0,
                          bottom: 5,
                          top: 45,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 50,
                          ),
                          child: Text(
                            "Chicken Fried ",
                            style: TextStyle(
                              color: Colors.black,
                              // backgroundColor: Colors.black,
                            ),
                            textScaleFactor: 2,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 250,
                        margin: EdgeInsets.only(
                          left: 0,
                          right: 0,
                          bottom: 5,
                          top: 45,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 50,
                          ),
                          child: Text(
                            "Chicken Burger ",
                            style: TextStyle(
                              color: Colors.black,
                              // backgroundColor: Colors.black,
                            ),
                            textScaleFactor: 2,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 150.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      aspectRatio: 16 / 9,
                      autoPlayAnimationDuration: Duration(
                        milliseconds: 6000,
                      ),
                      viewportFraction: 0.8,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 300,
                  // color: Colors.redAccent,
                  child: ListView(
                    children: [
                      CarouselSlider(
                        items: [
                          //1st Image of Slider
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage("images/friedchicken.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          //2nd Image of Slider
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage("images/friedchicken.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            // child: Text("Burger"),
                          ),

                          //3rd Image of Slider
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage("images/crispyfry.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          //4th Image of Slider
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage("images/friedchicken.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          //5th Image of Slider
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage("images/dish-1.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],

                        //Slider Container properties
                        options: CarouselOptions(
                          height: 250.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10.0,
              // ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Offers & Discounts',
                    textScaleFactor: 2,
                  ),
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("images/bakedcrunchy.jpg"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black54,
                            BlendMode.darken,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.20,
                    top: 75,
                    child: Row(
                      children: [
                        Text(
                          "𝕯 𝑐𝑎𝑓𝑒",
                          style: TextStyle(
                            color: Colors.yellow.shade900,
                          ),
                          textScaleFactor: 3,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Get Discount of",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textScaleFactor: 1.4,
                            ),
                            Text(
                              "30%",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textScaleFactor: 4,
                            ),
                            Text(
                              "Hello Khanxau",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textScaleFactor: 1.2,
                            ),
                            Text(
                              "Hello  Khanxau",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textScaleFactor: 1.2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
