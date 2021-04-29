import 'package:firebase_tutorial/services/authService.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class WelcomeScreen extends StatelessWidget {
  final displayName;
  final photoUrl;
  final email;
  WelcomeScreen(this.email, this.displayName, this.photoUrl);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                  '$photoUrl',
                  scale: 1.0,
                ),
                radius: 100,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('Name:' + '$displayName'),
              SizedBox(
                height: 10.0,
              ),
              Text('Email:' + '$email'),
              Text('Phone Number:' + ''),
              Container(
                child: RaisedButton(
                  color: Colors.red,
                  onPressed: () async {
                    await Authentication().signOut().then((value) =>
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => MyApp())));
                  },
                  child: Text('Sign out with google'),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
