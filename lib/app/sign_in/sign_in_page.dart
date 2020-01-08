import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  // Creating a new class for the main.dart
  @override
  Widget build(BuildContext context) {
    var scaffold3 = Scaffold(
      // Used to build the page
      appBar: AppBar(
        title: Text('Time Tracker'), // Text displayed on app bar
        elevation: 2,
      ),
      body: _buildContent(),
    );
    var scaffold2 = scaffold3;
    var scaffold = scaffold2;
    return scaffold;
  }

  Widget _buildContent() {
    // Set return type to be a widget
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        // A container can specify a widget child
        children: <Widget>[
          // A column has children which is a list of widgets
          Container(
            color: Colors.orange,
            // Widget for a box. Uses the container and creates individual space on page
            child: SizedBox(
              height: 100,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            color: Colors.red,
            child: SizedBox(
              // Widget for a box. Uses the container and creates individual space on page
              height: 100,
            ),
          ),
          SizedBox(height: 8),
          Container(
            color: Colors.purple,
            // Widget for a box. Uses the container and creates individual space on page
            child: SizedBox(
              height: 100,
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
