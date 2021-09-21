import 'package:CarLog_App/Model/GoogleSignIn.dart';
import 'package:CarLog_App/Widgets/Color/CustomColor.dart';
import 'package:CarLog_App/Widgets/CustomPainter/BackgroundPainter.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgoundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          Container(
            height: 1000,
            child: Column(
              children: [
                Spacer(),
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
                              padding: const EdgeInsets.all(16.0),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  imageUrl,
                                ),
                                radius: 50,
                                backgroundColor: Colors.transparent,
                              ),
                            )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "User Details",
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
// ****************************  Name *************************************
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(35, 10, 3, 3),
                                  child: Text(
                                    "Name",
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
                                    name,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black45,
                                      // fontFamily: "Pacifico"
                                    ),
                                  ),
                                ),

// **************************** Email *************************************
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(35, 10, 3, 3),
                                  child: Text(
                                    "email",
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
                                    email,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black45,
                                      // fontFamily: "Pacifico"
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
