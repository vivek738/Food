import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/adminAddDishes.dart';
import 'package:flutter_application_1/Admin/updateDishes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class DishesDetails extends StatefulWidget {
  const DishesDetails({Key? key}) : super(key: key);

  @override
  _DishesDetailsState createState() => _DishesDetailsState();
}

class _DishesDetailsState extends State<DishesDetails> {
  final storage = new FlutterSecureStorage();
  String url = 'http://10.0.2.2:90/';
  // String url = 'http://192.168.137.39:90/';
  // String url = 'http://192.168.10.108:90/';
  getDishes() async {
    var token = await storage.read(key: 'token');
    print(token);

    var res = await http.get(Uri.parse(url + 'all/prod'),
        headers: {'Authorization': 'Bearer $token'});
    var d = jsonDecode(res.body);
    print(d);
    return d;
  }

  //
  delete(String id) async {
    var token = await storage.read(key: 'token');
    var res = await http.delete(Uri.parse(url + 'delete/prod/${id}'),
        headers: {'Authorization': 'Bearer $token'});
    var d = jsonDecode(res.body);
    print(d);
    return d;
  }

  void initState() {
    super.initState();
    getDishes().then((d) {
      setState(() {
        return d;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Dishes details',
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminAddDishes()));
            },
            child: Icon(
              Icons.upload, // add custom icons also
            ),
          )),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 110.0,
                  vertical: 10.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/admin-add-dishes');
                  },
                  child: Text(
                    'Add Dish',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            FutureBuilder(
              future: getDishes(),
              builder: (context, AsyncSnapshot snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 25.0,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 200,
                                          width: double.infinity,
                                          child: Image(
                                            image: NetworkImage(
                                              url +
                                                  snapshot.data[index]
                                                      ['pphoto'],
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            '${snapshot.data[index]['pname']}',
                                            textScaleFactor: 2,
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: 10.0,
                                        // ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            '${snapshot.data[index]['pdesc']}',
                                            textScaleFactor: 1.4,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7.0,
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Rs. ${snapshot.data[index]['pprice']}',
                                            textScaleFactor: 1.4,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                // Navigator.pushNamed(
                                                //     context, "/admin-dishes");
                                                // Navigator.pushNamed(context,
                                                //     '/admin-update-dishes');
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            AdminUpdateDishes(
                                                                data: snapshot
                                                                        .data[
                                                                    index])));
                                              },
                                              child: Text(
                                                'Update',
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                delete(snapshot.data[index]
                                                    ['_id']);
                                                setState(() {});
                                              },
                                              child: Text(
                                                'Delete',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                    : CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
