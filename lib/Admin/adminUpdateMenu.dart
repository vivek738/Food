import 'package:flutter/material.dart';

class AdminUpdateMenu extends StatefulWidget {
  final data;
  const AdminUpdateMenu({Key? key, @required this.data}) : super(key: key);

  @override
  _AdminUpdateMenuState createState() => _AdminUpdateMenuState();
}

class _AdminUpdateMenuState extends State<AdminUpdateMenu> {
  // getting image from mobile gallery

  _imageDish() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Menus"),
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Update Menus"),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
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
                      onPressed: () {},
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
// 