import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:esewa_pnp/esewa.dart';
import 'package:esewa_pnp/esewa_pnp.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final storage = new FlutterSecureStorage();

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

  dlt(String id) async {
    var token = await storage.read(key: 'token');
    print(id);
    var res = await http.delete(Uri.parse(url + 'delete/card/${id}'),
        headers: {'Authorization': 'Bearer $token'});
    var d = jsonDecode(res.body);
    print(d);
    return d;
  }

  ESewaPnp? _esewaPnp;
  ESewaConfiguration? _configuration;
  @override
  void initState() {
    super.initState();
    card().then((res) {
      setState(() {
        return res;
      });
    });
    _configuration = ESewaConfiguration(
      clientID: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
      secretKey: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
      environment: ESewaConfiguration.ENVIRONMENT_TEST,
    );
    _esewaPnp = ESewaPnp(configuration: _configuration!);
  }

  double _amount = 100;
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add to Cart'),
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: card(),
              builder: (context, AsyncSnapshot snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 18.0,
                                horizontal: 20.0,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        child: Image(
                                          image: NetworkImage(
                                            url +
                                                '${snapshot.data[index]['prodid']['pphoto']}',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 80,
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 5.0,
                                          ),
                                          child: Column(
                                            children: [
                                              // // Text(
                                              // //   '${snapshot.data[index]['prodid']['pdesc']}',
                                              // //   textScaleFactor: 1.3,
                                              // // ),
                                              // // SizedBox(
                                              // //   height: 7.0,
                                              // ),
                                              Text(
                                                '${snapshot.data[index]['prodid']['pname']}',
                                              ),
                                              SizedBox(
                                                height: 7.0,
                                              ),
                                              Text(
                                                'Rs ${snapshot.data[index]['prodid']['pprice']}',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 80,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 5.0,
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Quantity',
                                              textScaleFactor: 1.3,
                                            ),
                                            SizedBox(
                                              height: 7.0,
                                            ),
                                            Text(
                                              '1',
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          dlt(snapshot.data[index]['_id']);
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ESewaPaymentButton(
                                    this._esewaPnp!,
                                    amount: _amount,
                                    callBackURL: "https://example.com",
                                    productId: "abc123",
                                    productName: "Flutter SDK Example",
                                    onSuccess: (result) {
                                       Navigator.pushNamed(context, '/dish');
                                     print('success');
                                    },
                                    onFailure: (e) {
                                      print('failed');
                                    },
                                  ),
                                  SizedBox(
                                    height: 84,
                                  ),
                                  
                                ],
                              ),
                            ),
                          );
                        })
                    : CircularProgressIndicator();
              })),
    );
  }
}
