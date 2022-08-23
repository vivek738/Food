import 'dart:async';
import 'dart:convert';
import 'package:flutter_application_1/screens/HomePage/homepage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:proximity_sensor/proximity_sensor.dart';
import 'package:flutter/foundation.dart' as foundation;

class DishHomepage extends StatefulWidget {
  const DishHomepage({Key? key}) : super(key: key);

  @override
  _DishHomepageState createState() => _DishHomepageState();
}

class _DishHomepageState extends State<DishHomepage> {
  // String url = 'http://10.0.2.2:90/';

  // String url = 'http://192.168.137.39:90/';
  String url = 'http://10.0.2.2:90/';
  getDishes() async {
    // var token = await storage.read(key: 'token');
    // print(token);

    var res = await http.get(Uri.parse(url + 'all/prod'));
    var d = jsonDecode(res.body);
    print(d.length);
    return d;
  }

  final storage = new FlutterSecureStorage();

  addtcart(String prodid) async {
    var token = await storage.read(key: 'token');
    print(prodid);
    print(token);
    var res = await http.post(Uri.parse(url + 'addtocart/${prodid}'),
        headers: {'Authorization': 'Bearer ${token}'});
    var d = jsonDecode(res.body);
    if (res.statusCode == 200) {
      print(d);
      return res;
    }
  }

  // // proximity sensor start here
  bool _isNear = false;
  late StreamSubscription<dynamic> _streamSubscription;
  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  Future<void> listenSensor() async {
    FlutterError.onError = (FlutterErrorDetails details) {
      if (foundation.kDebugMode) {
        FlutterError.dumpErrorToConsole(details);
      }
    };
    _streamSubscription = ProximitySensor.events.listen((int event) {
      setState(() {
        _isNear = (event > 0) ? true : false;
        if (_isNear == true) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDishes().then((d) {
      setState(() {
        return d;
      });
    });
    listenSensor().then((value) {
      setState(() {
        return value;
      });
    });
  }

  // void initState() {
  //   super.initState();
  //   getDishes().then((d) {
  //     setState(() {
  //       return d;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text('Dishe Page'),
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: getDishes(),
            builder: (context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 400,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            url +
                                                snapshot.data[index]['pphoto'],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
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
                                            Navigator.pushNamed(context,
                                                '/admin-update-dishes');
                                          },
                                          child: Text(
                                            'Buy',
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            addtcart(
                                              snapshot.data[index]['_id'],
                                            );
                                            Navigator.pushNamed(
                                                context, "/add-to-cart");
                                            MotionToast.success(
                                              description: Text(
                                                "Dishproduct Added Sucessfully",
                                              ),
                                            ).show(context);
                                          },
                                          child: Text(
                                            'Add to Cart',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      })
                  : CircularProgressIndicator();
            },
          ),
        ));
  }
}
