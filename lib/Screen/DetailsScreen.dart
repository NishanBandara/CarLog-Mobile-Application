import 'package:CarLog_App/Model/GoogleSignIn.dart';
import 'package:CarLog_App/Widgets/Color/CustomColor.dart';
import 'package:CarLog_App/Widgets/CustomPainter/BackgroundPainter.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_container/neumorphic_container.dart';

String brandName, imgUlr;
double vehiclePrice, horsePower;

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Color color = Color(0xfff0f0f0);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CarLog",
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                imageUrl,
              ),
              radius: 20,
              backgroundColor: Colors.transparent,
            ),
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
          Container(
            height: 1000,
            child: Column(
              children: [
                // Spacer(),

                Container(
                  height: 550,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Image(
                                  image: NetworkImage(
                                    "https://i.ibb.co/dW0q3qx/2020-jaguar-e-pace-angularfront.jpg",
                                  ),
                                  height: 150,
                                  width: 300,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                  child: InkWell(
                                    onTap: () {},
                                    child: NeumorphicContainer(
                                      height: 60,
                                      width: 60,
                                      borderRadius: 60,
                                      primaryColor: color,
                                      //concave neumorphism design
                                      curvature: Curvature.concave,
                                      child: Icon(
                                        Icons.info_outline,
                                        color: secondaryColor,
                                        size: 30,
                                      ),
                                      // borderColor: Colors.orange,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                  child: NeumorphicContainer(
                                    height: 60,
                                    width: 60,
                                    borderRadius: 60,
                                    primaryColor: color,
                                    curvature: Curvature.concave,
                                    child: Icon(
                                      Icons.settings,
                                      color: secondaryColor,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                  child: NeumorphicContainer(
                                    height: 60,
                                    width: 60,
                                    borderRadius: 60,
                                    primaryColor: color,
                                    curvature: Curvature.concave,
                                    child: Icon(
                                      Icons.monetization_on_sharp,
                                      color: secondaryColor,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
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
                              padding: const EdgeInsets.fromLTRB(60, 1, 60, 3),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(35, 10, 3, 3),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(35, 5, 3, 3),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(35, 10, 3, 3),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(35, 5, 3, 3),
                                  child: Text(
                                    horsePower.toStringAsFixed(2) + " Avg. HP",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black45,
                                      // fontFamily: "Pacifico"
                                    ),
                                  ),
                                ),

// **************************** Price *************************************
                                //

                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 180, right: 15),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: secondaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0))),
                                    width: 200,
                                    height: 40,
                                    child: Center(
                                        child: Text(
                                      "Rs. " + vehiclePrice.toStringAsFixed(2),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    )),
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
                              color: secondaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
