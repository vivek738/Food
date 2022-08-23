import 'package:flutter/material.dart';

class AdminMenuDetails extends StatefulWidget {
  const AdminMenuDetails({Key? key}) : super(key: key);

  @override
  _AdminMenuDetailsState createState() => _AdminMenuDetailsState();
}

class _AdminMenuDetailsState extends State<AdminMenuDetails> {
  // getting image from mobile gallery

  _imageDish() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Menus"),
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
                    Text("Add Menus"),
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
