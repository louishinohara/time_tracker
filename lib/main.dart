import 'package:flutter/material.dart';

import './app/sign_in/sign_in_page.dart';

void main() {         // Entry point of the program
  runApp(MyApp());    // Used to run the app
}

class MyApp extends StatelessWidget {     // Class which is called in main. Stateless because values inside are immutable
  @override
  Widget build(BuildContext context) {    // Stateless widgets need a build method
    return MaterialApp(                   // Body of the app
      title: 'Time Tracker',
      theme: ThemeData(                   // Defines many visual properties for the app (default values for app)
        primarySwatch: Colors.indigo,     // Primary color of the theme for the app
      ),
      home: SignInPage(),                 // Calling another class for the home of the app
    );
  }
}
