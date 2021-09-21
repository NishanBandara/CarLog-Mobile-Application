import 'package:CarLog_App/Model/GoogleSignIn.dart';
import 'package:CarLog_App/Screen/HomeScreen.dart';
import 'package:CarLog_App/Screen/LoginScreen.dart';
import 'package:CarLog_App/Screen/ProfileScreen.dart';
import 'package:CarLog_App/Widgets/Color/CustomColor.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return email != null
        ? Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
//************************  USer **********************************************
                new UserAccountsDrawerHeader(
                  accountName: Text(
                    name,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  accountEmail: Text(email,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white54,
                      )),
                  currentAccountPicture: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new CircleAvatar(
                      backgroundImage: NetworkImage(
                        imageUrl,
                      ),
                      radius: 30,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  decoration: BoxDecoration(color: primaryColor),
                ),
                SizedBox(
                  height: 10,
                ),

// ******************   list 1 - Home **********************************************
                Container(
                  child: ListTile(
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                    leading: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(Icons.home, size: 30, color: grayColor)
                          ],
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return HomeScreen();
                      }));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 1, 10, 5),
                  child: const Divider(
                    height: 1,
                    thickness: 1,
                    indent: 2,
                    endIndent: 2,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
// ******************   list 2 - Profile **********************************************
                Container(
                  child: ListTile(
                    title: Text(
                      'Profile',
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                    leading: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(Icons.person, size: 30, color: grayColor)
                          ],
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return ProfileScreen();
                      }));
                    },
                  ),
                ),

                breaker(),

                SizedBox(
                  height: 300,
                ),
// ******************    SignOUt **********************************************

                ListTile(
                  tileColor: primaryColor,
                  title: new GestureDetector(
                    onTap: () {
                      signOutGoogle();

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }), ModalRoute.withName('/'));
                    },
                    child: Text(
                      'Sign out',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  leading: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(Icons.logout, size: 30, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : CircularProgressIndicator();
  }
}

Widget breaker() => Padding(
      padding: const EdgeInsets.fromLTRB(10, 1, 10, 5),
      child: const Divider(
        height: 1,
        thickness: 1,
        indent: 2,
        endIndent: 2,
      ),
    );
