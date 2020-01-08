import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  // Creating a new class for the main.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Used to build the page
      appBar: AppBar(
        title: Text('Time Tracker'), // Text displayed on app bar
        elevation: 2,
      ),
      body: Container(
          color: Colors.white,
          child: Column( // A container can specify a widget child
            children: <Widget>[ // A column has children which is a list of widgets 
              Container(color: Colors.orange,)
            ],
          )),
    );
  }
}
