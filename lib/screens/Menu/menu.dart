import 'package:flutter/material.dart';

class MenusDetails extends StatefulWidget {
  const MenusDetails({Key? key}) : super(key: key);

  @override
  _MenusDetailsState createState() => _MenusDetailsState();
}

class _MenusDetailsState extends State<MenusDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Menu Page'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Menu Details',
                    textScaleFactor: 2,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                'images/friedchicken.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          // child: Image(
                          //   image: AssetImage(
                          //     'images/friedchicken.jpg',
                          //   ),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Burger',
                            textScaleFactor: 2,
                          ),
                        ),
                        // SizedBox(
                        //   height: 10.0,
                        // ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Crunchy chicken burger with extra spice',
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
                                    context, '/admin-update-dishes');
                              },
                              child: Text(
                                'Buy',
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Add to Cart',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                'images/friedchicken.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          // child: Image(
                          //   image: AssetImage(
                          //     'images/friedchicken.jpg',
                          //   ),
                          //   fit: BoxFit.cover,
                          // ),
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
                                    context, '/admin-update-dishes');
                              },
                              child: Text(
                                'Buy',
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Add to Cart',
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
