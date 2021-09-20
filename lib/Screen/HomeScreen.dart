import 'dart:convert';

import 'package:CarLog_App/Model/CarDetails.dart';
import 'package:CarLog_App/Widgets/Color/CustomColor.dart';
import 'package:CarLog_App/Widgets/Drawer/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;

import 'DetailsScreen.dart';

String name = "Nishan";
String email = 'nishanmbandara@gmail.com';

String imgURL =
    "https://i.ibb.co/v43z1fr/Generic-compact-red-car-isolated-on-white-background.jpg";
// "https://i.ibb.co/zXydz1y/Car.jpg";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CarDetails> _cars = List<CarDetails>();

  Future<List<CarDetails>> fetchCarDetails() async {
    var url =
        "https://private-anon-b242a842d4-carsapi1.apiary-mock.com/manufacturers";

    var response = await http.get(url);

    var cars = List<CarDetails>();

    if (response.statusCode == 200) {
      var carsJson = jsonDecode(response.body);

      for (var carJson in carsJson) {
        cars.add(CarDetails.fromJson(carJson));
      }
    }
    return cars;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetchCarDetails().then((value) {
      setState(() {
        _cars.addAll(value);
      });
    });

    return Scaffold(
      backgroundColor: backgoundColor,
      appBar: AppBar(
        title: Text(
          "CarLog",
          style: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.w800),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(image: AssetImage("images/Car.jpg")),
          )
        ],
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "welcome, " + name,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.view_list_rounded), onPressed: () {}),
                  IconButton(icon: Icon(Icons.grid_view), onPressed: () {})
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              itemBuilder: (context, index) {
                return Container(
                    color: Colors.white,
                    height: 250,
                    width: 150,
                    child: InkWell(
                      onTap: () {
// *************************** Assign Data ************************************
                        // imgUlr = imgURL;
                        brandName = _cars[index].carBrand;
                        vehiclePrice = _cars[index].carPrice;
                        horsePower = _cars[index].horsePower;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen()),
                        );
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                          elevation: 5,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 3,
                                color: Colors.green,
                              ),
                              Stack(children: [
                                Center(
                                  child: Image(
                                    image: NetworkImage(imgURL), width: 300,
                                    height: 110,
                                    //  AssetImage("images/Car.jpg"),
                                  ),
                                )
                              ]),
                              SizedBox(
                                height: 72,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.all(3.0),
                                  //   child: Text(
                                  //     _cars[index]
                                  //         .horsePower
                                  //         .toStringAsFixed(2),
                                  //     style: TextStyle(
                                  //         color: Colors.black54, fontSize: 13),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 12,
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       left: 60, right: 10),
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //         color: primaryColor,
                                  //         borderRadius: BorderRadius.all(
                                  //             Radius.circular(30.0))),
                                  //     width: 120,
                                  //     height: 30,
                                  //     child: Center(
                                  //         child: Text(
                                  //       "Rs. " +
                                  //           _cars[index]
                                  //               .carPrice
                                  //               .toStringAsFixed(0),
                                  //       style: TextStyle(
                                  //           color: Colors.white,
                                  //           fontSize: 18,
                                  //           fontWeight: FontWeight.w500),
                                  //     )),
                                  //   ),
                                  // )

                                  Container(
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12.0),
                                        bottomRight: Radius.circular(12.0),
                                      ),
                                    ),
                                    // color: Colors.green,
                                    width: 300,
                                    height: 55,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Center(
                                        child: Text(
                                          _cars[index].carBrand,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ));
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              itemCount: _cars.length,
            ),
          ),
        ],
      ),
    );
  }
}
