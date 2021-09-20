import 'package:CarLog_App/Widgets/Color/CustomColor.dart';
import 'package:CarLog_App/Widgets/CustomPainter/BackgroundPainter.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_container/neumorphic_container.dart';

String brandName;
double vehiclePrice, horsePower;

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: backgoundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          Column(
            children: [
              Spacer(),
              // SizedBox(
              //   height: 100,
              // ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shape:
                      // Border(right: BorderSide(color: Colors.green, width: 5)),

                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                  //     side: BorderSide(width: 5, color: Colors.green)),
                  // NeumorphicContainer(
                  //   borderRadius: 10,
                  //   curvature: Curvature.concave,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image(
                            image: AssetImage("images/Car.jpg"),
                            height: 100,
                            width: 120,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Vehicle Information",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 1, 60, 5),
                        child: const Divider(
                          height: 1,
                          thickness: 1,
                          indent: 2,
                          endIndent: 2,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
// **************************** Brand Name *************************************
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 10, 3, 3),
                            child: Text(
                              "Brand",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500
                                  // fontFamily: "Pacifico"
                                  ),
                            ),
                          ),

// **************************** Horse Power *************************************
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 5, 3, 3),
                            child: Text(
                              brandName,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black45,
                                // fontFamily: "Pacifico"
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 10, 3, 3),
                            child: Text(
                              "Horse Power",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500
                                  // fontFamily: "Pacifico"
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 5, 3, 3),
                            child: Text(
                              horsePower.toString() + " Avg. HP",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black45,
                                // fontFamily: "Pacifico"
                              ),
                            ),
                          ),

// **************************** Price *************************************
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 10, 3, 3),
                            child: Text(
                              "Price",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 5, 3, 3),
                            child: Text(
                              "Rs. " + vehiclePrice.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black45,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 5,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
