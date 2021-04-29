import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_tutorial/services/authService.dart';
import 'package:flutter/material.dart';

import 'newScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sign In',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://lh3.googleusercontent.com/a-/AOh14GiusOqN_nFf1I9pvMPEn90WeX-xk4SfYtn0eHRP=s96-c'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Row(
          //   children: [
          //     Container(
          //       child: TextFormField(
          //         initialValue: "email@domain.com",
          //       ),
          //     ),
          //     Container(
          //       child: TextFormField(
          //         keyboardType: TextInputType.visiblePassword,
          //         initialValue: "Password",
          //       ),
          //     ),
          //     Container(
          //       child: TextButton(
          //         onPressed: () {},
          //         child: Text('Login'),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.

      bottomNavigationBar: Container(
        child: RaisedButton(
          onPressed: () async {
            FirebaseAuth auth = FirebaseAuth.instance;
            await Authentication().handleSignIn().then((value) =>
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WelcomeScreen(
                            auth.currentUser.email,
                            auth.currentUser.displayName,
                            auth.currentUser.photoURL))));
          },
          color: Colors.red,
          elevation: 1.0,
          child: Text(
            'Sign in with google',
            style: TextStyle(
              color: Colors.white.withOpacity(.9),
              fontSize: 30,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}
