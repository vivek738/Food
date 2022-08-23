import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';

class AdminAddDishes extends StatefulWidget {
  const AdminAddDishes({Key? key}) : super(key: key);

  @override
  _AdminAddDishesState createState() => _AdminAddDishesState();
}

class _AdminAddDishesState extends State<AdminAddDishes> {
  File? _image;
  String pname = '';
  String pprice = '';
  String pdesc = '';

  //
  final storage = new FlutterSecureStorage();
  final key = GlobalKey<FormState>();

  String url = 'http://10.0.2.2:90/';
  // String url = 'http://192.168.137.39:90/';
  // String url = 'http://192.168.10.108:90/';

  Future<bool> addDish() async {
    var token = await storage.read(key: 'token');
    // print(token);
    // try {
    // var postUri = Uri.parse(url + "add/prod''");
    var request =
        new http.MultipartRequest("POST", Uri.parse(url + 'add/prod'));
    print(request);
    //Header....
    request.headers['Authorization'] = 'Bearer ${token}';
    request.fields['pname'] = pname;
    request.fields['pprice'] = pprice;
    request.fields['pdesc'] = pdesc;
    // image
    request.files
        .add(await http.MultipartFile.fromPath('pphoto', _image!.path));
    http.StreamedResponse response = await request.send();
    print(response);
    final respStr = await response.stream.bytesToString();
    var jsonData = jsonDecode(respStr);
    print(jsonData);
    return true;
    // } catch (e) {
    //   return false;
    // }
  }

  // getting image from mobile gallery

  _imageDish() async {
    final dish_image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(dish_image!.path);
    });
  }

  //
  getDishes() async {
    var res = await http.get(Uri.parse(url + 'all/prod'));
    var d = jsonDecode(res.body) as Map;
    print(d);
    return d;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Dishes"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Form(
                key: key,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Add Dishes"),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      onSaved: (val) {
                        pname = val!;
                      },
                      decoration: InputDecoration(
                        hintText: "Dish title",
                        labelText: "Enter dish title",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      onSaved: (val) {
                        pprice = val!;
                      },
                      decoration: InputDecoration(
                        hintText: "Dish price",
                        labelText: "Enter dish price",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      onSaved: (val) {
                        pdesc = val!;
                      },
                      decoration: InputDecoration(
                        hintText: "Dish description",
                        labelText: "Enter dish description",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(
                          double.infinity,
                          50,
                        ),
                      ),
                      onPressed: () async {
                        key.currentState!.save();
                        var ok = await _imageDish();
                        if (ok == true) {
                          print('post');
                        }
                        print('object');
                      },
                      child: Text(
                        "Upload Photo",
                        textScaleFactor: 2,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          double.infinity,
                          50,
                        ),
                      ),
                      onPressed: () {
                        key.currentState!.save();
                        addDish();
                        Navigator.pushNamed(context, "/admin-dishes");
                        MotionToast.success(
                          description: Text(
                            "Dishes added successfully",
                          ),
                        ).show(context);
                      },
                      child: Text(
                        "Post",
                        textScaleFactor: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
