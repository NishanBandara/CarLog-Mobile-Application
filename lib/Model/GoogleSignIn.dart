import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

var name, email, imageUrl, uID;

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

Future<String> googleSignIn() async {
  final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken);

  final UserCredential userCredential =
      await _firebaseAuth.signInWithCredential(authCredential);
  final User user = userCredential.user;

  assert(user.photoURL != null);
  assert(user.displayName != null);
  assert(user.email != null);

  name = user.displayName;
  email = user.email;
  imageUrl = user.photoURL;
  uID = user.uid;

  print("****************************************");
  print("UId : " + uID);
  print('IdToken: ' + user.getIdToken().toString());
  print("refreshToken" + user.refreshToken.toString());
  print("Name: " + name);
  print("Email: " + email);
  print("Image: " + imageUrl);
  print("****************************************");

  final User currentUser = await _firebaseAuth.currentUser;
  assert(currentUser.uid == user.uid);

  return name;
}

void signOutGoogle() async {
  await _googleSignIn.signOut();
  print("Sign out Successfully");
}
