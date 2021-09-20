import 'package:CarLog_App/Screen/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Poppins',
      ),
      home: SplashScreen(),
    );
  }
}

class TestFb extends StatefulWidget {
  @override
  _TestFbState createState() => _TestFbState();
}

class _TestFbState extends State<TestFb> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            final FacebookLoginResult result =
                await facebookSignIn.logIn(['email']);

            switch (result.status) {
              case FacebookLoginStatus.loggedIn:
                final FacebookAccessToken accessToken = result.accessToken;
                print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
                break;
              case FacebookLoginStatus.cancelledByUser:
                print('Login cancelled by the user.');
                break;
              case FacebookLoginStatus.error:
                print('Something went wrong with the login process.\n'
                    'Here\'s the error Facebook gave us: ${result.errorMessage}');
                break;
            }
          },
          child: Text("Facebook"),
        ),
      ),
    );
  }
}
