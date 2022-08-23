import 'package:flutter/material.dart';
import 'package:flutter_application_1/Admin/updateDishes.dart';

class MenuDetails extends StatefulWidget {
  const MenuDetails({Key? key}) : super(key: key);

  @override
  _MenuDetailsState createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Menu details',
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminUpdateDishes(
                            data: null,
                          )));
            },
            child: Icon(
              Icons.add_a_photo, // add custom icons also
            ),
          )),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/admin-add-menu');
                    },
                    child: Text(
                      'Add Menu',
                    ),
                  ),
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
                            image: AssetImage(
                              'images/friedchicken.jpg',
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
                            'Dish Title',
                            textScaleFactor: 2,
                          ),
                        ),
                        // SizedBox(
                        //   height: 10.0,
                        // ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Dish description',
                            textScaleFactor: 1.4,
                          ),
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Rs. 120',
                            textScaleFactor: 1.4,
                          ),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/admin-update-menu');
                              },
                              child: Text(
                                'Update',
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            ElevatedButton(
                              onPressed: () {},
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
          ),
        ),
      ),
    );
  }
}
