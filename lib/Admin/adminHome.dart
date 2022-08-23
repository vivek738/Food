import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin Dashboard",
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("seanparker"),
              accountEmail: Text("seanparker123@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(
                    "images/Admin.png",
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.blue.shade800,
              ),
              hoverColor: Colors.amberAccent,
              title: Text("Home"),
              onTap: () {
                Navigator.pushNamed(context, '/admin-homepage');
              },
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.add_a_photo_rounded,
            //   ),
            //   hoverColor: Colors.amberAccent,
            //   title: Text("Add Dishes"),
            //   onTap: () {
            //     Navigator.pushNamed(context, "/admin-add-dishes");
            //   },
            // ),
            ListTile(
              leading: Icon(
                Icons.food_bank,
                color: Colors.blue,
              ),
              hoverColor: Colors.blue[50],
              title: Text("Dishes"),
              onTap: () {
                Navigator.pushNamed(context, '/admin-dishes');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.restaurant_menu_sharp,
                color: Colors.blue,
              ),
              hoverColor: Colors.amberAccent,
              title: Text("Menu"),
              onTap: () {
                Navigator.pushNamed(context, '/admin-menus');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.blue,
              ),
              hoverColor: Colors.amberAccent,
              title: Text("Log out"),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                // Text(
                //   "",
                //   textScaleFactor: 2,
                // ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              5.0,
                            ),
                          ),
                        ),
                        child: Column(children: [
                          Text(
                            "Total Admin",
                            textScaleFactor: 1.8,
                          ),
                          Text(
                            "2",
                            textScaleFactor: 2,
                          ),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              5.0,
                            ),
                          ),
                        ),
                        child: Column(children: [
                          Text(
                            "Total User",
                            textScaleFactor: 1.8,
                          ),
                          Text(
                            "3",
                            textScaleFactor: 2,
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              5.0,
                            ),
                          ),
                        ),
                        child: Column(children: [
                          Text(
                            "Total Dishes",
                            textScaleFactor: 1.8,
                          ),
                          Text(
                            "5",
                            textScaleFactor: 2,
                          ),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              5.0,
                            ),
                          ),
                        ),
                        child: Column(children: [
                          Text(
                            "Total Menu",
                            textScaleFactor: 1.8,
                          ),
                          Text(
                            "10",
                            textScaleFactor: 2,
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
