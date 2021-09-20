import 'package:CarLog_App/Widgets/Color/CustomColor.dart';
import 'package:CarLog_App/Widgets/Drawer/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'DetailsScreen.dart';

String name = "Nishan";
String email = 'nishanmbandara@gmail.com';

String vName = "chrysler";
double vPrice = 25.99;
double vHPower = 291.3;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
            child: homeGridView(),
          )
        ],
      ),
    );
  }
}

Widget homeGridView() => StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 5,
      itemBuilder: (context, index) {
        return Container(
            color: Colors.white,
            height: 250,
            width: 200,
            child: InkWell(
              onTap: () {
                brandName = vName;
                vehiclePrice = vPrice;
                horsePower = vHPower;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsScreen()),
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
                      // SizedBox(
                      //   height: 2,
                      // ),
                      Container(
                        width: double.infinity,
                        height: 3,
                        color: Colors.green,
                      ),
                      Stack(children: [
                        Image(
                          image: AssetImage("images/Car.jpg"),
                        )
                      ]),
                      Text(
                        vName,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              vHPower.toString() + " Avg HP",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 60, right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                              width: 120,
                              height: 30,
                              child: Center(
                                  child: Text(
                                "Rs. " + vPrice.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              )),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
            ));
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      itemCount: 100,
    );
