import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> handleSignIn() async {
    GoogleSignInAccount googleUser = await googleSignIn
        .signIn(); /*calls the signIn method, this will open the email dialog box whereuser can select his email isto sign in to the app.*/

    GoogleSignInAuthentication googleSignInAuth =
        await googleUser.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuth.idToken,
      accessToken: googleSignInAuth.accessToken,
    ); // create a login credential]

    print(credential);

    User result = (await auth.signInWithCredential(credential)).user;
    print('${result.displayName}');
    print('${result.email}');
    print(result.providerData);

    // return result;
    // var user = await auth.signInWithCredential(credential);
    //
    // // User user = await auth.currentUser;
    // print(user.user.email);
    // print(user.user.displayName);
    // print(user.user.photoURL);
  }

  Future<void> signOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    print("User signed out");
  }
}
