import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';
import 'package:time_tracker/services/auth_provider.dart';

import './app/landing_page.dart';

void main() {
  // Entry point of the program
  runApp(MyApp()); // Used to run the app
}

class MyApp extends StatelessWidget {
  // Class which is called in main. Stateless because values inside are immutable
  @override
  Widget build(BuildContext context) {
    // Stateless widgets need a build method
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        // Body of the app
        title: 'Time Tracker',
        theme: ThemeData(
          // Defines many visual properties for the app (default values for app)
          primarySwatch:
              Colors.indigo, // Primary color of the theme for the app
        ),
        home: LandingPage(
        ), // Calling another class for the home of the app
      ),
    );
  }
}
