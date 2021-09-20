import 'package:CarLog_App/Model/GoogleSignIn.dart';
import 'package:CarLog_App/Widgets/CustomPainter/BackgroundPainter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          Column(
            children: [
              Spacer(),

              Spacer(),

              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image(
                  image: AssetImage("images/CarLog_Logo.png"),
                  height: 200,
                  width: 300,
                ),
              ),

              SizedBox(
                height: 10,
              ),

// ****************** google signIn Button *************************************
              Padding(
                padding: const EdgeInsets.fromLTRB(85, 3, 85, 3),
                child: InkWell(
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image(
                              height: 30,
                              width: 30,
                              image: AssetImage("images/Google.png")),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Sign in with Google",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black38,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    await Fluttertoast.showToast(
                        msg: "Please wiat a moment ...",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        //  ProjectColor().Clr_DarkBlue,
                        fontSize: 10.0);

                    // signInWithGoogle();

                    googleSignIn().whenComplete(
                      () {
                        if (name != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              print("****************************************");
                              print("Name:" + name + "   |  Email:" + email);
                              print("****************************************");

                              print("****************************************");
                              // return Farmer_PersonalInfor();

// Check Shared preference Status
                              return HomeScreen();
                            }),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Text(
                "or ",
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 10,
              ),

// ****************** google Facebook Button *************************************
              Padding(
                padding: const EdgeInsets.fromLTRB(85, 3, 85, 3),
                child: InkWell(
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image(
                              height: 30,
                              width: 30,
                              image: AssetImage("images/facebook.png")),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Sign in with Facebook",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black38,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {},
                ),
              ),

              Spacer(),
            ],
          )
        ],
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleuser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleuser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    Fluttertoast.showToast(msg: "Account created");
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
