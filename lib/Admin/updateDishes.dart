import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';

class AdminUpdateDishes extends StatefulWidget {
  final data;
  const AdminUpdateDishes({Key? key, @required this.data}) : super(key: key);

  @override
  _AdminUpdateDishesState createState() => _AdminUpdateDishesState();
}

class _AdminUpdateDishesState extends State<AdminUpdateDishes> {
  File? _image;
  String pname = '';
  String pprice = '';
  String pdesc = '';
  final key = GlobalKey<FormState>();

  //
  final storage = new FlutterSecureStorage();

  String url = 'http://10.0.2.2:90/';
  // String url = 'http://192.168.137.39:90/';
  // String url = 'http://192.168.10.108:90/';
  Future<bool> update(String id) async {
    var token = await storage.read(key: 'token');
    print(pprice);
    try {
      var postUri = Uri.parse(url + "update/prod/${id}");
      var request = new http.MultipartRequest("PUT", postUri);
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
      return jsonData;
    } catch (e) {
      return false;
    }
  }

  void initState() {
    super.initState();
  }

  // getting image from mobile gallery

  _imageDish() async {
    final dish_image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(dish_image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Dishes"),
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
                    Text("Update Dishes"),
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
                      onPressed: () {
                        _imageDish();
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
                        update(widget.data['_id']);
                        Navigator.pushNamed(context, "/admin-dishes");
                        MotionToast.success(
                          description: Text(
                            "Dish Upated successfully",
                          ),
                        ).show(context);
                      },
                      child: Text(
                        "Update",
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
